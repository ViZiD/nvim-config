local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- чтоб было красиво
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"kdheepak/tabline.nvim",
		requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})
	use({ "RRethy/vim-illuminate" })
	use({ "rmagatti/auto-session" })
	use({ "brenoprata10/nvim-highlight-colors" })

	-- colorscheme
	use({
		"folke/tokyonight.nvim",
	})
	use({ "tanvirtin/monokai.nvim", commit = "45427b20f29ad1e7ce8bba3152428d6928ae8f09" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "cpea2506/one_monokai.nvim" })

	-- syntax
	use("mhartington/formatter.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		"windwp/nvim-ts-autotag",
	})

	-- auto cmp, lsp, etc
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	})
	-- auto cmp
	use({
		{ "ms-jpq/coq_nvim", branch = "coq", commit = "5eddd31bf8a98d1b893b0101047d0bb31ed20c49" },
		-- { "ms-jpq/coq_nvim", branch = "coq" },

		{ "ms-jpq/coq.artifacts", branch = "artifacts" },
		{ "ms-jpq/coq.thirdparty", branch = "3p" },
	})

	use({ "windwp/nvim-autopairs" })
	use({ "numToStr/Comment.nvim" })

	-- dap
	use({ "mfussenegger/nvim-dap" })
	use({ "mfussenegger/nvim-dap-python" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
