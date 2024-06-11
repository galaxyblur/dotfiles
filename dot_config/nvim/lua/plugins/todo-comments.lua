return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")
    local wk = require("which-key")

    wk.register({
      ["]t"] = { function() todo_comments.jump_next() end, "Go to next todo" },
      ["[t"] = { function() todo_comments.jump_prev() end, "Go to previous todo" },
    });

    todo_comments.setup()
  end,
}
