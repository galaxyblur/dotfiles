return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
  config = function()
    local wk = require("which-key")
    wk.register({
      ["<Leader>"] = {
        w = {
          name = "[W]indows...",
          k = { ":wincmd k<CR>", "Go to top window" },
          j = { ":wincmd j<CR>", "Go to bottom window" },
          h = { ":wincmd h<CR>", "Go to left window" },
          l = { ":wincmd l<CR>", "Go to right window" },
        },
        s = {
          name = "[S]plit window...",
          v = { "<C-w>v", "Split window vertically" },
          h = { "<C-w>h", "Split window horizontally" },
          e = { "<C-w>=", "Equalize window splits" },
          c = { "<CMD>close<CR>=", "Close split window" },
        },
        b = {
          name = "[B]uffer...",
          d = { "<CMD>bd<CR>", "Close buffer" },
          p = { "<CMD>BufferLineCyclePrev<CR>", "Go to previous buffer" },
          n = { "<CMD>BufferLineCycleNext<CR>", "Go to next buffer" },
        },
        f = {
          name = "[F]ind files...",
          f = { "<CMD>Telescope find_files<CR>", "Find files in cwd (fuzzy)" },
          r = { "<CMD>Telescope oldfiles<CR>", "Find recent files (fuzzy)" },
          s = { "<CMD>Telescope live_grep<CR>", "Find string in files (cwd)" },
          c = { "<CMD>Telescope grep_string<CR>", "Find string under cursor in files (cwd)" },
          t = { "<CMD>TodoTelescope<CR>", "Find todos" },
        },
        e = {
          name = "[E]xplorer...",
          e = { "<CMD>Neotree<CR>", "Open file explorer" },
        },
      },

      ["<Leader>nh"] = { "<CMD>nohl<CR>", "Clear search highlights" },

      ["[b"] = { "<CMD>BufferLineCyclePrev<CR>", "Go to previous buffer" },
      ["]b"] = { "<CMD>BufferLineCycleNext<CR>", "Go to next buffer" },

      ["<C-k>"] = { ":wincmd k<CR>", "Go to top window" },
      ["<C-j>"] = { ":wincmd j<CR>", "Go to bottom window" },
      ["<C-h>"] = { ":wincmd h<CR>", "Go to left window" },
      ["<C-l>"] = { ":wincmd l<CR>", "Go to right window" },

      -- See also: formatting.lua, gitsigns.lua, todo-comments.lua
    })
  end,
}
