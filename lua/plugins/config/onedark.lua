-- remove default keymap for toggle style
vim.g.onedark_toggle_style_keymap = "<nop>"

-- setup onedark
require("onedark").setup()

-- change colorscheme to trigger autocmdgroup colorscheme
-- such as in nvim-web-devicons
vim.cmd "colorscheme onedark"
