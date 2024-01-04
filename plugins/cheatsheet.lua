return {
  {

    "sudormrfbin/cheatsheet.nvim",
    cmd = "Cheatsheet",
    event = "User AstroFile",
    config = function()
      require("cheatsheet").setup {
        bundled_cheatsheets = false,
        bundled_plugin_cheatsheets = false,
      }
    end,
  },
}
