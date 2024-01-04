return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup {
      aliases = {
        ["a"] = ">",
        ["p"] = ")",
        ["c"] = "}",
        ["b"] = "]",
        ["q"] = { '"', "'", "`" },
        ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
      },
      highlight = {
        duration = 200,
      },
      move_cursor = false,
    }
  end,
}
