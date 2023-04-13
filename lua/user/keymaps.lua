-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
local opts_noremap = { silent = true, noremap = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- -- Telescope
-- keymap("n", "<leader>d", ":Telescope find_files<CR>", opts)
-- keymap("n", "<leader>dt", ":Telescope live_grep<CR>", opts)
-- keymap("n", "<leader>dp", ":Telescope projects<CR>", opts)
-- keymap("n", "<leader>db", ":Telescope buffers<CR>", opts)

-- format
keymap("n", "<leader>f", ":Format<CR>", opts)
keymap("n", "<leader>F", ":FormatWrite<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<Cmd>:TablineBufferNext<CR>", opts_noremap)
