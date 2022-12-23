local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/packer/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer.... please close and reopen Noevim")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('EdenEast/nightfox.nvim')
  use("kyazdani42/nvim-web-devicons")
  use {'neovim/nvim-lspconfig'}
  use("onsails/lspkind.nvim")
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  }
  use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
  use("hrsh7th/cmp-buffer")
  use("windwp/nvim-ts-autotag")
	use("leafoftree/vim-svelte-plugin")
  use("prichrd/netrw.nvim")

  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use("folke/zen-mode.nvim")
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

 use {'lewis6991/gitsigns.nvim'}
 use {'tmsvg/pear-tree'}
end)


