local fn = vim.fn

-- clone package manager if not existant
local intall_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(intall_path)) > 0 then
	fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", intall_path})
	vim.cmd "packadd packer.nvim"
end


return require("packer").startup(function()
	--packer managing itself
	use "wbthomason/packer.nvim"


	-- Appereance ---------------------------------------------------
	-- Lelegs -------------------------------------------------------


	--statusline
	use { "nvim-lualine/lualine.nvim",
		requires = {"kyazdani42/nvim-web-devicons", opt = true},
		config = function() require("plugins.config.lualine") end
	}

	--colorscheme
	use { "navarasu/onedark.nvim", config = function() require("plugins.config.onedark") end}

	-- buffer/tabline
	--use { "romgrk/barbar.nvim", 
	--	requires = {"kyazdani42/nvim-web-devicons"},
	--	config = function() require("barbar")
	--	} 
	

    -- Language Support ---------------------------------------------
	-- leligs -------------------------------------------------------


	--treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		branch = "0.5-compat",
		event = "BufRead",
		config = function() require("plugins.config.treesitter") end
	}

	--sane(I hope) default configs for a number of lsps ------------
	use { "neovim/nvim-lspconfig" }

	-- autocomplete wuhu -------------------------------------------
	use {
		"hrsh7th/nvim-cmp",
		requires = { { "hrsh7th/cmp-buffer" },
					 { "hrsh7th/cmp-path" },
					 { "hrsh7th/cmp-cmdline" },
					 { "petertriho/cmp-git" },
					 { "hrsh7th/cmp-calc" },
					 { "hrsh7th/cmp-nvim-lsp" },
					 { "hrsh7th/cmp-nvim-lua" },
					 { "hrsh7th/cmp-emoji" },
					 { "tzachar/cmp-tabnine", run='./install.sh'},
					 },
		config = function() require("plugins.config.nvim-cmp") end
	}

	--snippet engine required for nvim cmp
	use { "L3MON4D3/LuaSnip", after = "nvim-cmp" }

	use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }

	--additional functionality for nvim cmp
	-- function signature on hover
	use { "ray-x/lsp_signature.nvim", after = "nvim-lspconfig",
			config = function() require("lsp_signature").setup() end }
	
	--pictograms in lsp completion
	use { "onsails/lspkind-nvim" }

	-- Addons ------------------------------------------------------
	-- Lelugs ------------------------------------------------------


	--file browser
	use {
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function() require("plugins.config.nvim-tree") end
	}

	--startup page
	use {
		"goolord/alpha-nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function() require("plugins.config.alpha") end
		}

	--finder lel
	use {
		 'nvim-telescope/telescope.nvim',
		 requires = { {"nvim-lua/plenary.nvim"},
					  {"nvim-treesitter/nvim-treesitter", opt =true},
					  {"kyazdani42/nvim-web-devicons", opt = true},
					  {"sudormrfbin/cheatsheet.nvim"},
					  {"nvim-telescope/telescope-fzf-native.nvim", run = 'make'} },
		 cmd = "Telescope",
		 config = function() require("plugins.config.telescope") end
	 }


end)


