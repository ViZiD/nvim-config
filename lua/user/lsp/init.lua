local lsp = require("lspconfig")
local coq = require("coq")

local on_attach = function(client, bufnr)
	require("illuminate").on_attach(client)

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gs", vim.lsp.buf.references, bufopts)
end

lsp.clangd.setup(coq.lsp_ensure_capabilities({ filetypes = { "c" }, on_attach = on_attach }))
lsp.pyright.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "off",
			},
		},
	},
}))
lsp.eslint.setup(coq.lsp_ensure_capabilities({
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	on_attach = on_attach,
}))

lsp.tsserver.setup(coq.lsp_ensure_capabilities({
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	on_attach = on_attach,
}))

lsp.lua_ls.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}))
lsp.bashls.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
lsp.lemminx.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
lsp.dartls.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
lsp.yamlls.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
lsp.taplo.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
lsp.jsonls.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
lsp.dockerls.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
