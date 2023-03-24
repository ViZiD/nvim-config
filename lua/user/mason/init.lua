require("mason").setup({
	ui = {
		border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"eslint",
		"pyright",
		"tsserver",
		"yamlls",
		"dockerls",
		"taplo",
		"jsonls",
	},
	automatic_installation = true,
})

require("mason-tool-installer").setup({

	ensure_installed = {
		"stylua",
		"black",
		"isort",
		"jq",
		"prettier",
		"yamlfmt",
		"clang-format",
		"shfmt",
	},

	auto_update = true,

	run_on_start = true,

	start_delay = 3000, -- 3 second delay
})
