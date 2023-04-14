vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	-- Color schemes
	use("sainnhe/everforest")
	-- use('morhetz/gruvbox')
	-- use({ 'rose-pine/neovim', as = 'rose-pine' })

	-- LSP and Mason
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("jose-elias-alvarez/typescript.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	-- CMP nad LSKind
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("onsails/lspkind.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Git
	use("tpope/vim-fugitive")

	-- Treesiter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")

	-- Text
	use("windwp/nvim-autopairs")

	-- Others
	use("nvim-lualine/lualine.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("akinsho/toggleterm.nvim")
	use("numToStr/Comment.nvim")
	use("mg979/vim-visual-multi")
	-- use('xiyaowong/transparent.nvim')
end)
