local tree_cb = require("nvim-tree.config").nvim_tree_callback

local TREE_WIDTH = 30

require("nvim-tree").setup({
	-- disables netrw completely
	disable_netrw = false,
	-- hijack netrw window on startup
	hijack_netrw = true,
	-- open the tree when running this setup function
	open_on_setup = true,
	-- opens the tree when changing/opening a new tab if the tree wasn't previously opened
	open_on_tab = false,
	-- hijack the cursor in the tree to put it at the start of the filename
	hijack_cursor = false,
	-- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
	update_cwd = true,
	-- opens in place of the unnamed buffer if it's empty
	hijack_unnamed_buffer_when_opening = false,
	--false by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree
	respect_buf_cwd = true,
	update_focused_file = {
		-- enables the feature
		enable = true,
		-- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
		-- only relevant when `update_focused_file.enable` is true
		update_cwd = true,
		-- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
		-- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
		ignore_list = {},
		update_root = true,
	},
	system_open = {
		-- the command to run this, leaving nil should work in most cases
		cmd = "",
		-- the command arguments as a list
		args = {},
	},
	renderer = {
		add_trailing = false,
		group_empty = true,
		highlight_git = true,
		highlight_opened_files = "none",
		root_folder_modifier = ":~",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		width = TREE_WIDTH,
		side = "left",
		hide_root_folder = false,
		number = false,
		relativenumber = false,
		mappings = {
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h",                  cb = tree_cb("close_node") },
				{ key = "v",                  cb = tree_cb("vsplit") },
			},
		},
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = true,
		},
		open_file = {
			quit_on_open = false,
			-- if true the tree will resize itself after opening a file
			resize_window = true,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
})
