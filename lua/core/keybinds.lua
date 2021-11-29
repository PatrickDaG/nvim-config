--global keybinds
vim.g.mapleader = " "

local set = vim.api.nvim_set_keymap

--change window with alt
set("", "<M-down>" , "<down>" , { noremap = true, silent = true })
set("", "<M-up>"   , "<up>"   , { noremap = true, silent = true })
set("", "<M-left>" , "<left>" , { noremap = true, silent = true })
set("", "<M-right>", "<right>", { noremap = true, silent = true })

--scroll with cursor loch
set("" , "<S-down>" , ""   , { noremap = true, silent = true })
set("" , "<S-up>"   , ""   , { noremap = true, silent = true })
set("i", "<S-down>" , "a", { noremap = true, silent = true })
set("i", "<S-up>"   , "a", { noremap = true, silent = true })
