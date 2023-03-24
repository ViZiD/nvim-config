Headers = {
	py = {
		"#!/usr/bin/env python3",
		"# -*- coding:utf-8 -*-",
		"# Copyright (c) 2022 Radik Islamov <vizid1337@gmail.com>, et al.",
	},
	sh = { "#!/bin/bash", "", "set -o errexit", "set -o nounset", "set -o pipefail", "", "" },
	dart = { "// Copyright (c) 2022 Radik Islamov <vizid1337@gmail.com>, et al." },
	js = { "// Copyright (c) 2022 Radik Islamov <vizid1337@gmail.com>, et al. " },
	ts = { "// Copyright (c) 2022 Radik Islamov <vizid1337@gmail.com>, et al. " },
	jsx = { "// Copyright (c) 2022 Radik Islamov <vizid1337@gmail.com>, et al. " },
	tsx = { "// Copyright (c) 2022 Radik Islamov <vizid1337@gmail.com>, et al. " },
}

local function add_header()
	local filetype = vim.fn.expand("%:e")
	if Headers[filetype] ~= nil then
		vim.fn.setline(".", Headers[filetype])
	end
end

local _group = vim.api.nvim_create_augroup("AutoHeader", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = { "*.sh", "*.py", "*.dart", "*.js", "*.ts", "*.jsx", "*.tsx" },
	callback = add_header,
	once = true,
	group = _group,
})
