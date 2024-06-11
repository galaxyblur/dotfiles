return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
    signs = {
      add          = { text = '+' },
      change       = { text = '|' },
      delete       = { text = '-' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
      local wk = require("which-key")

      wk.register({
        ["]h"] = { function() gs.next_hunk() end, "Next Hunk" },
        ["[h"] = { function() gs.prev_hunk() end, "Prev Hunk" },

        ["<Leader>"] = {
          h = {
            name = "[H]unk...",
            s = { function() gs.stage_hunk() end, "Stage hunk" },
            r = { function() gs.reset_hunk() end, "Reset hunk" },
            S = { function() gs.stage_buffer() end, "Stage buffer" },
            R = { function() gs.reset_buffer() end, "Reset buffer" },
            u = { function() gs.undo_stage_hunk() end, "Undo stage hunk" },
            p = { function() gs.preview_hunk() end, "Preview hunk" },
            b = {
              function()
                gs.blame_line({ full = true })
              end,
              "Blame line",
            },
            B = { function() gs.toggle_current_line_blame() end, "Toggle line blame" },
            d = { function() gs.diffthis() end, "Diff this" },
            D = { function() gs.diffthis("~") end, "Diff this ~" },
          },
        },
      })

      wk.register({
        ["<Leader>"] = {
          h = {
            name = "[H]unk...",
            s = {
              function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
              end,
              "Stage hunk",
            },
            r = {
              function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
              end,
              "Reset hunk",
            },
          },
        },
      }, { mode = "v" })

			-- Text object
      wk.register({
        ["ih"] = { ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk" },
      }, { mode = { "o", "x" } })
		end,
	},
}
