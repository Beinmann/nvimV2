-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'ThePrimeagen/harpoon'
    use 'mbbill/undotree'
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use('tpope/vim-fugitive')

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	---- Rosepine theme
	--require('packer').startup(function(use)
		--use({ 'rose-pine/neovim', as = 'rose-pine' })
	--end)

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
	})
    require('rose-pine').setup({
        dim_nc_background = false,
        disable_background = true,
        disable_float_background = true,
    })

    use({
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    })
    use ("rebelot/kanagawa.nvim")

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})



    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            -- {'williamboman/mason.nvim'},
            -- {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }


    -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
    use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
    use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
    -- use 'romgrk/barbar.nvim'
    use 'tpope/vim-eunuch'
    -- use 'vim-airline/vim-airline'
    -- use 'chentoast/marks.nvim'
    use 'kshenoy/vim-signature'

end)
