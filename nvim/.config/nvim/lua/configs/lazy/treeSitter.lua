return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "java", "python", "bash" },
          sync_install = false,
          highlight = {
			  enable = true,
			  additional_vim_regex_highlighting = { "markdown" },
	  },
          indent = { enable = true },  
			vim.cmd("hi Comment guifg=NvimLightGreen")
        })
    end
 }
