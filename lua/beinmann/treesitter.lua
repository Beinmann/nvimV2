-- Offline tree-sitter setup.
--
-- Grammar sources are vendored in ts/grammars/<lang>/src and the matching
-- queries in queries/<lang>/ (see scripts/vendor_ts.lua). Parsers are compiled
-- locally with the system C compiler into stdpath('data')/site/parser the first
-- time a filetype needs them (or via :TSBuild). No network, no tree-sitter CLI,
-- no nvim-treesitter plugin. If a parser is missing and cannot be built,
-- Neovim's regular regex `syntax` highlighting stays active.

local M = {}

local grammars = vim.fn.stdpath('config') .. '/ts/grammars'
local outdir = vim.fn.stdpath('data') .. '/site/parser'
local building = {} -- lang -> list of callbacks
M.failed = {} -- lang -> error message

-- Parsers a language needs besides its own.
local companions = { markdown = { 'markdown_inline' } }

local function compiler(cpp)
  for _, c in ipairs(cpp and { 'c++', 'g++', 'clang++' } or { 'cc', 'gcc', 'clang' }) do
    if vim.fn.executable(c) == 1 then return c end
  end
end

function M.vendored(lang)
  return vim.uv.fs_stat(grammars .. '/' .. lang .. '/src/parser.c') ~= nil
end

local function so_path(lang) return outdir .. '/' .. lang .. '.so' end

local function up_to_date(lang)
  local so = vim.uv.fs_stat(so_path(lang))
  local src = vim.uv.fs_stat(grammars .. '/' .. lang .. '/src/parser.c')
  return so and src and so.mtime.sec >= src.mtime.sec
end

--- Compile one parser. `cb(ok, err)` is called on the main loop.
function M.build(lang, force, cb)
  cb = cb or function() end
  if not M.vendored(lang) then return cb(false, 'no vendored sources for ' .. lang) end
  if not force and up_to_date(lang) then return cb(true) end
  if building[lang] then return table.insert(building[lang], cb) end

  local src = grammars .. '/' .. lang .. '/src'
  local files = { '-x', 'c', src .. '/parser.c' }
  local cpp = false
  for _, n in ipairs({ 'scanner.c', 'scanner.cc', 'scanner.cpp' }) do
    if vim.uv.fs_stat(src .. '/' .. n) then
      cpp = n ~= 'scanner.c'
      vim.list_extend(files, { '-x', cpp and 'c++' or 'c', src .. '/' .. n })
    end
  end
  local cc = compiler(cpp)
  if not cc then
    local err = 'no C' .. (cpp and '++' or '') .. ' compiler found (need cc/gcc/clang)'
    M.failed[lang] = err
    return cb(false, err)
  end

  vim.fn.mkdir(outdir, 'p')
  local tmp = so_path(lang) .. '.tmp' .. vim.uv.hrtime()
  local cmd = { cc, '-shared', '-fPIC', '-O2', '-w', '-I', src }
  vim.list_extend(cmd, files)
  vim.list_extend(cmd, { '-o', tmp })

  building[lang] = { cb }
  vim.system(cmd, { text = true }, vim.schedule_wrap(function(r)
    local cbs = building[lang]
    building[lang] = nil
    local ok, err = r.code == 0, nil
    if ok then
      ok, err = os.rename(tmp, so_path(lang))
      M.failed[lang] = nil
    else
      err = r.stderr
      os.remove(tmp)
      M.failed[lang] = err
    end
    for _, f in ipairs(cbs) do f(ok, err) end
  end))
end

local function build_all(langs, force, done)
  local list = {}
  for _, l in ipairs(langs) do
    list[#list + 1] = l
    vim.list_extend(list, companions[l] or {})
  end
  local pending, failed = #list, {}
  if pending == 0 then return done(true, failed) end
  for _, l in ipairs(list) do
    M.build(l, force, function(ok)
      if not ok then failed[#failed + 1] = l end
      pending = pending - 1
      if pending == 0 then done(#failed == 0, failed) end
    end)
  end
end

-- language.add() returns nil, err (does not throw) when the parser is missing
-- We load our own build by explicit path: the runtimepath lookup can miss
-- site/parser/ if that directory was created after Neovim started.
local function has_parser(lang)
  local opts = vim.uv.fs_stat(so_path(lang)) and { path = so_path(lang) } or nil
  local ok, loaded = pcall(vim.treesitter.language.add, lang, opts)
  return ok and loaded and true or false
end

local function start(buf, lang)
  if not vim.api.nvim_buf_is_valid(buf) then return end
  if has_parser(lang) then pcall(vim.treesitter.start, buf, lang) end
end

function M.setup()
  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true }),
    callback = function(ev)
      local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
      if M.vendored(lang) and (not up_to_date(lang) or not has_parser(lang)) then
        -- compile in the background, then enable; regex syntax is used meanwhile
        build_all({ lang }, false, function() start(ev.buf, lang) end)
      else
        start(ev.buf, lang)
      end
    end,
  })

  vim.api.nvim_create_user_command('TSBuild', function(opts)
    local langs = opts.fargs
    local force = #langs == 0 or opts.bang
    if #langs == 0 then
      for name, t in vim.fs.dir(grammars) do
        if t == 'directory' and M.vendored(name) then langs[#langs + 1] = name end
      end
    end
    build_all(langs, force, function(ok, failed)
      if ok then
        vim.notify(('TSBuild: %d parser(s) ready'):format(#langs))
      else
        for _, l in ipairs(failed) do
          vim.notify(('TSBuild: %s failed:\n%s'):format(l, M.failed[l] or '?'), vim.log.levels.WARN)
        end
      end
    end)
  end, {
    nargs = '*',
    bang = true,
    desc = 'Compile vendored tree-sitter parsers (all if no argument)',
    complete = function()
      local t = {}
      for name, ty in vim.fs.dir(grammars) do
        if ty == 'directory' and M.vendored(name) then t[#t + 1] = name end
      end
      return t
    end,
  })
end

return M
