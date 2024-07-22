-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
--
-- -- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

-- Create an autocommand group to avoid duplication
vim.api.nvim_create_augroup("WrapTextFiles", { clear = true })

-- Enable text wrapping for markdown and text files
vim.api.nvim_create_autocmd("FileType", {
  group = "WrapTextFiles",
  pattern = { "markdown", "text" },
  command = "setlocal wrap",
})
