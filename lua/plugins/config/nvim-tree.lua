local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_special_files = {}

map("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>T", ":NvimTreeFindFile<CR>", opts)


require "nvim-tree".setup{
	open_on_tab = true,
	git = {
		ignore = true
	},
	view = {
	   auto_resize = true, -- resize window to small
	},
	filters = {
		dotfiles = false,
		custom = {".git"}
	}
}
