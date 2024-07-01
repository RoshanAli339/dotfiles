vim.g.mapleader = " "

local keymap = vim.keymap

-- NvimTree Keymaps
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")

-- Nvim Telescope Keymaps
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<CR>")

-- BUfferline Keymaps
keymap.set("n", "<leader>bl", "<cmd>BufferLineCycleNext<CR>")
keymap.set("n", "<leader>bh", "<cmd>BufferLineCyclePrev<CR>")
keymap.set("n", "<leader>ql", "<cmd>BufferLineCloseRight<CR>")
keymap.set("n", "<leader>qh", "<cmd>BufferLineCloseLeft<CR>")

-- Markdown preview keymaps
keymap.set("n", "<leader>mv", "<cmd>MarkdownPreview<CR>")
keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>")

-- Mappings to resize windows
keymap.set("n", "<leader>-", "<cmd>vertical resize -2<CR>")
keymap.set("n", "<leader>=", "<cmd>vertical resize +2<CR>")
keymap.set("n", "<leader>_", "<cmd>horizontal resize -2<CR>")
keymap.set("n", "<leader>+", "<cmd>horizontal resize +2<CR>")
