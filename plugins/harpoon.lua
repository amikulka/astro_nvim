local prefix = "<leader><leader>"
local maps = { n = {} }
local icon = vim.g.icons_enabled and "󱡀 " or ""
local conf = require("telescope.config").values

maps.n[prefix] = { desc = icon .. "Harpoon" }
require("astronvim.utils").set_mappings(maps)

local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
    })
    :find()
end

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "Harpoon" },
    keys = {
      { prefix .. "a", function() require("harpoon"):list():append() end, desc = "Add file" },
      {
        prefix .. "e",
        function() require("harpoon.ui"):toggle_quick_menu(require("harpoon"):list()) end,
        desc = "Toggle quick menu",
      },
      { prefix .. "f", function() toggle_telescope(require("harpoon"):list()) end, desc = "Open harpoon in telescope" },

      -- { "<C-p>", function() require("harpoon"):list():prev() end, desc = "Go to previous mark" },
      -- { "<C-n>", function() require("harpoon"):list():next() end, desc = "Go to next mark" },

      { "<C-m>", function() require("harpoon"):list():select(1) end, desc = "Go to harpoon mark 1" },
      { "<C-,>", function() require("harpoon"):list():select(2) end, desc = "Go to harpoon mark 2" },
      { "<C-.>", function() require("harpoon"):list():select(3) end, desc = "Go to harpoon mark 3" },
      { "<C-/>", function() require("harpoon"):list():select(4) end, desc = "Go to harpoon mark 4" },
    },
  },
}
