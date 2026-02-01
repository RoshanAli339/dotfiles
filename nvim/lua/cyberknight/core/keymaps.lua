local opts = { noremap = true, silent = true}
local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "


keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)


keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)

keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

keymap.set("x", "<leader>p", [["_dP]])

keymap.set("v", "p", '"_dp', opts)

keymap.set({"n", "v"}, "<leader>d", [["_d]])

keymap.set("n", "<leader>nh", ":nohl<CR>", opts)

keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)

keymap.set("n", "<Tab>", "<cmd>bn<cr>", opts)
keymap.set("n", "<S-Tab>", "<cmd>bp<cr>", opts)


keymap.set("n", "sv", ":vertical split<cr>", opts)
keymap.set("n", "ss", ":split<cr>", opts)
keymap.set("n", "sx", ":close<cr>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

keymap.set("n", "<leader>e", ":lua MiniFiles.open()<cr>", opts)

keymap.set("n", "<leader>z", ":Lazy<cr>", opts)
