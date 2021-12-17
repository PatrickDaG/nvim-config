local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map("n", "<leader>a", "<Plug>(EasyAlign)", opts)
map("v", "<leader>a", "<Plug>(EasyAlign)", opts)
