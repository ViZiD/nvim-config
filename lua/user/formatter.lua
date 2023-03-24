-- Utilities for creating configurations
-- local util = require("formatter.util")

local filetypes = require("formatter.filetypes")

function Format_isort_with_black()
	return {
		exe = "isort",
		args = { "--profile", "black", "-q", "-" },
	}
end

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = { filetypes.lua.stylua },
		typescriptreact = { filetypes.typescriptreact.prettier },
		typescript = { filetypes.typescript.prettier },
		javascriptreact = { filetypes.javascriptreact.prettier },
		javascript = { filetypes.javascript.prettier },
		json = { filetypes.json.jq },
		css = { filetypes.css.stylefmt },
		html = { filetypes.html.prettier },
		toml = { filetypes.toml.taplo },
		yaml = { filetypes.yaml.yamlfmt },
		sh = { filetypes.sh.shfmt },
		c = { filetypes.c.clangformat },
		dart = { filetypes.dart.dartformat },
		python = { filetypes.python.black, Format_isort_with_black },
		["*"] = {
			filetypes.any.remove_trailing_whitespace,
		},
	},
})
