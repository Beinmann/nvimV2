require('rose-pine').setup({
    dim_nc_background = true,
    disable_background = false,
    disable_float_background = false,
})

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = nil })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })

end

vim.cmd("colorscheme rose-pine")

ColorMyPencils()
