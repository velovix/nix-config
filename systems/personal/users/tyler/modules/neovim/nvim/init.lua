require("config.lazy")

vim.opt.number = true
vim.opt.scrolloff = 10

vim.opt.autoread = true

function noremap(mode, keys, mappings, options)
	vim.api.nvim_set_keymap(
		mode,
		keys,
		mappings,
		{ noremap = true, unpack(options) }
	)
end

function inoremap(keys, mappings, options)
	noremap("i", keys, mappings, options)
end

function nnoremap(keys, mappings, options)
	noremap("n", keys, mappings, options)
end

-- Set up leader shortcuts
-- Found here: https://www.reddit.com/r/neovim/comments/xbcg90/comment/inynxqo/
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Leader>v", ":vsplit<CR>", { noremap = true })
nnoremap("<Leader>s", ":w<CR>", {})
nnoremap("<Leader>v", ":vsplit<CR>", {})
nnoremap("<Leader>w", "<C-w>", {})

inoremap("jk", "<esc>", {})

-- Arrow keys for fast scrolling
nnoremap("<Up>", "10k", {})
nnoremap("<C-k>", "10k", {})
nnoremap("<Down>", "10j", {})
nnoremap("<C-j>", "10j", {})

-- Shortcut for clearing find highlighting
nnoremap("<C-l>", ":nohl<CR><C-l>", {silent = true})

require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

