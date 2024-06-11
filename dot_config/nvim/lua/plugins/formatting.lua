return {
  "stevearc/conform.nvim",
  dependencies = {
    "zapling/mason-conform.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        vue = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    require("mason-conform").setup({})

    local wk = require("which-key")
    wk.register({
      ["<Leader>"] = {
        c = {
          name = "[C]ode...",
          F = {
            function()
              vim.lsp.buf.format()
              print("Code formatted (default method)")
            end,
            "Format code (default method)",
          },
          f = {
            function()
              conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
              })
              print("Code formatted")
            end,
            "Format code",
          },
        },
      },
    }, { mode = { "n", "v" } })
  end,
}
