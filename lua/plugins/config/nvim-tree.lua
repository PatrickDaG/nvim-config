local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

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
	},
	renderer = {
		highlight_open_files = "all",
		add_trailing = true,
		group_empty = true,
		special_files = {},
	},
}
