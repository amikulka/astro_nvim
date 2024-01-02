return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "lua",
      "python",
      "rust",
      "javascript",
      "typescript",
      "yaml",
      "json",
    })
    require("nvim-treesitter.configs").setup {
      textobjects = {
        select = {
          keymaps = {
            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
            ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
            ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

            ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function def" },
            ["im"] = { query = "@function.outer", desc = "Select inner part of a method/function def" },

            ["ai"] = { query = "@conditional.outer", desc = "Select around conditional" },
            ["ii"] = { query = "@conditional.inner", desc = "Select inside conditional" },
          },
        },
        swap = {
          swap_next = {
            ["<leader>na"] = { "@parameter.inner", desc = "Swap parameter/argument with next" },
            ["<leader>nm"] = { "@function.outer" },
          },
          swap_previous = {
            ["<leader>pa"] = "@parameter.inner",
            ["<leader>pm"] = "@function.outer",
          },
        },
      },
    }
  end,
}
