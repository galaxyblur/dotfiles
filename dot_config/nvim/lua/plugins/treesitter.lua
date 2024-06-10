return {
	"nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			--[[
      ensure_installed = {
        -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
        "c", "lua", "vim", "vimdoc", "query",
        "bash",
        "javascript", "typescript", "json", "jsdoc",
        "html", "css", "scss", "vue",
        "xml", "sql", "php", "java", "tsx",
        -- "tmux",
        "python", "swift", "kotlin", "svelte", "ruby", "rust", "go",
        "dockerfile", "yaml", "toml", "regex", "csv",
        "gdscript",
        -- "gdresource", "gdshader",
        "glsl", "wgsl",
        "gitignore", "gitcommit", "gitattributes", "git_config", "git_rebase",
      },
      ]]
			highlight = { enable = true },
			indent = { enable = true },
      autotag = { enable = true },
		})
	end,
}
