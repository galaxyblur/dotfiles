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

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- Navigation
			map("n", "]h", gs.next_hunk, "Next Hunk")
			map("n", "[h", gs.prev_hunk, "Prev Hunk")

			-- Actions
			map("n", "<Leader>hs", gs.stage_hunk, "Stage hunk")
			map("n", "<Leader>hr", gs.reset_hunk, "Reset hunk")
			map("v", "<Leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage hunk")
			map("v", "<Leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset hunk")

			map("n", "<Leader>hS", gs.stage_buffer, "Stage buffer")
			map("n", "<Leader>hR", gs.reset_buffer, "Reset buffer")

			map("n", "<Leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

			map("n", "<Leader>hp", gs.preview_hunk, "Preview hunk")

			map("n", "<Leader>hb", function()
				gs.blame_line({ full = true })
			end, "Blame line")
			map("n", "<Leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

			map("n", "<Leader>hd", gs.diffthis, "Diff this")
			map("n", "<Leader>hD", function()
				gs.diffthis("~")
			end, "Diff this ~")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
		end,
	},
}
