
--required programs
--ripgrep
--fd
--?pynvim
--git
--nvim




--basic global settings
require "core.config"
require "core.keybinds"


--should not be here but we stupid
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
