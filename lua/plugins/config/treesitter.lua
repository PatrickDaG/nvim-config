require "nvim-treesitter.configs" .setup {
	ensure_installed = {
		"lua",
		"c",
		"cpp",
		"latex",
		"rust",
		"json",
		"bash",
		"bibtex",
		"cmake",
		"cuda",
		"java",
		"json5",
		"regex",
		"ruby",
		"vim",
		"yaml"
	},
	highlight = {
		enable = true,
		use_languagetree = true
	}
}
