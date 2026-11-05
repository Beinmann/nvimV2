# Neovim Config

Personal Neovim configuration for Linux. Built on top of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) with personal additions and cleanups.

## Requirements

- Neovim >= 0.10
- `git`
- `make` — for telescope-fzf-native (`sudo apt install make`)
- `rg` (ripgrep) — for telescope grep (`sudo apt install ripgrep`)
- A C compiler (`gcc`/`cc`) — compiles the vendored treesitter grammars locally (optional: without it, regex syntax highlighting is used)
- `xclip` — for system clipboard integration

On first launch, lazy.nvim will install all plugins automatically.

## Structure

```
init.lua                        Entry point — loads all modules in order
│
├── lua/beinmann/               Personal settings and keymaps
│   ├── init.lua                Loads the other beinmann modules
│   ├── set.lua                 Editor options (tabs, line numbers, undo, etc.)
│   ├── remap.lua               Personal keymaps
│   └── functions.lua           Utility functions (toggle autosave)
│
├── lua/other/
│   └── kickstart_nvim.lua      Plugin manager (lazy.nvim) + all plugin configs
│
├── lua/kickstart/
│   └── health.lua              :checkhealth checks
│
├── lua/custom/plugins/
│   └── init.lua                Placeholder for additional plugins (returns {})
│
└── vimscript/beinmann/
    ├── remaps.vim              Additional keymaps in Vimscript
    └── autocmd.vim             Autocommands (view persistence, quickfix, netrw)
```

## Plugins

| Plugin | Purpose |
|---|---|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [rose-pine](https://github.com/rose-pine/neovim) | Colorscheme |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configuration |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |
| [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) | Bridges mason and lspconfig |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git diff signs and hunk actions |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Git commands inside nvim |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints popup |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim) | Neovim Lua API type annotations |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | LSP progress indicator |
| [mbbill/undotree](https://github.com/mbbill/undotree) | Visual undo history |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | `gc` to toggle comments |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guide lines |
| [vim-sleuth](https://github.com/tpope/vim-sleuth) | Auto-detect tab/indent style |
| [vim-eunuch](https://github.com/tpope/vim-eunuch) | Unix file commands (`:Rename`, `:Delete`, etc.) |
| [vim-signature](https://github.com/kshenoy/vim-signature) | Mark display in the sign column |

## Keymaps

**Leader key:** `Space`

### Navigation
| Key | Action |
|---|---|
| `<leader>pv` | Open netrw file explorer |
| `<leader>q` | Close window, or open explorer if last window |
| `<leader>-` | Switch to last buffer |
| `<leader>bl` | List buffers and select |
| `<leader>bb` | New empty buffer |
| `H` | Jump to start of visual line |
| `L` | Jump to end of visual line |
| `j` / `k` | Move by visual lines (wraps correctly) |

### Files & Search (Telescope)
| Key | Action |
|---|---|
| `<leader>pf` | Find files |
| `<C-p>` | Find git-tracked files |
| `<leader>ps` | Grep with input prompt |
| `<leader>pp` | Switch buffer |
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sw` | Grep current word |
| `<leader>sh` | Search help tags |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>sk` | Show all keymaps (show keys) |
| `<leader>/` | Fuzzy search current buffer |
| `<leader>gf` | Find git files |

### Git (Gitsigns + Fugitive)
| Key | Action |
|---|---|
| `<leader>gs` | Open git status (fugitive) |
| `]c` / `[c` | Next / previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage entire buffer |
| `<leader>hR` | Reset entire buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame current line |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>tb` | Toggle inline blame |
| `<leader>td` | Toggle show deleted lines |

### LSP
| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gI` | Go to implementation |
| `gr` | Find references |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `]d` / `[d` | Next / previous diagnostic |
| `<leader>f` | Format buffer |

### Editing
| Key | Action |
|---|---|
| `<C-s>` | Save file (normal and insert mode) |
| `jk` | Exit insert mode |
| `x` | Delete character without yanking |
| `C` | Delete character and enter insert mode |
| `p` (visual) | Paste without overwriting register |
| `gc` | Toggle comment (line or selection) |
| `§` | Alias for `@` (run macro) |

### Undo & History
| Key | Action |
|---|---|
| `<leader>u` | Toggle undotree panel |

### Autosave
Run `:ToggleAutoSave` to toggle autosave on/off. When enabled, the file is written on every `InsertLeave` event.

## LSP

LSPs are managed by Mason. Run `:Mason` to install language servers. The config has `lua_ls` (Lua) pre-configured. Add more servers to the `servers` table in `lua/other/kickstart_nvim.lua`.

## Treesitter

Works fully offline. Grammar sources are vendored in `ts/grammars/` and their queries in `queries/` (all MIT / Apache-2.0, see `THIRD_PARTY.md`). The first time a filetype is opened, its parser is compiled with the system C compiler into `~/.local/share/nvim/site/parser/` (in the background; regex syntax is used until it finishes). No network, `tree-sitter` CLI or nvim-treesitter plugin needed. If no compiler is available, Neovim's regular `syntax` highlighting stays active.

- `:TSBuild [lang...]` — (re)compile parsers; with no argument, all of them.
- Vendored: `python`, `json`, `html`, `css`, `java`, `sql`, `markdown`, `markdown_inline`, `diff`, `c`, `cpp`, `lua`, `vim`, `bash`, `javascript`, `typescript`, `tsx`, `go`, `rust`, `yaml`, `toml`, `dockerfile`, `make`, `cmake`, `regex`, `gitcommit`, `git_config`.
- Update or add grammars (needs network, run once on a connected machine, then commit): add the language to `scripts/vendor_ts.lua`, then `git clone --depth 1 https://github.com/nvim-treesitter/nvim-treesitter /tmp/nts && nvim -l scripts/vendor_ts.lua /tmp/nts`.
- Tree-sitter indentation is not used; Neovim's per-filetype indent is.

Built-in parsers (bundled with Neovim, no install needed): `c`, `lua`, `markdown`, `vim`, `vimdoc`, `query`.
