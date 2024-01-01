return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "        ███████   ██████",
        "        ██       ██    ██",
        "        ██  ███  ██    ██",
        "        ██   ██  ██    ██",
        "        ███████   ██████",
        " ",
        "  █████  ██      ██  █████  ██    ██",
        " ██   ██ ██      ██ ██   ██  ██  ██",
        " ███████ ██  ██  ██ ███████   ████",
        " ██   ██ ██ ████ ██ ██   ██    ██",
        " ██   ██ ████  ████ ██   ██    ██",
      }
      return opts
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function(plugin, opts)
      require("gitsigns").setup {
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500,
          virt_text_pos = "right_align",
        },
      }
    end,
  },
  { -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer", -- Buffer Completions
      "hrsh7th/cmp-path", -- Path Completions
      "saadparwaiz1/cmp_luasnip", -- Snippet Completions
      "hrsh7th/cmp-nvim-lsp", -- LSP Completions
      "hrsh7th/cmp-nvim-lua", -- Lua Completions
      "hrsh7th/cmp-cmdline", -- CommandLine Completions
      "L3MON4D3/LuaSnip", -- Snippet Engine
      "rafamadriz/friendly-snippets", -- Bunch of Snippets
    },
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp, lspkind, luasnip = require "cmp", require "lspkind", require "luasnip"

      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match "^%s*$" == nil
      end
      -- modify the mapping part of the table
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", group_index = 2, priority = 1000 },
        { name = "luasnip", group_index = 2, priority = 750 },
        { name = "buffer", group_index = 2, priority = 500 },
        { name = "path", group_index = 2, priority = 250 },
        { name = "copilot", group_index = 2 },
      }
      opts.formatting = {
        format = lspkind.cmp_format {
          mode = "symbol",
          max_width = 50,
          symbol_map = { Copilot = "" },
        },
      }
      opts.mapping["<Tab>"] = vim.schedule_wrap(function(fallback)
        if cmp.visible() and has_words_before() then
          cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end)
      opts.sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.exact,
          require("copilot_cmp.comparators").prioritize,

          -- Below is the default comparitor list and order for nvim-cmp
          cmp.config.compare.offset,
          -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  -- {
  --   "folke/which-key.nvim",
  --   config = function(plugin, opts)
  --     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- Add bindings which show up as group name
  --     local wk = require "which-key"
  --     wk.register({
  --       b = { name = "Buffer" },
  --     }, { mode = "n", prefix = "<leader>" })
  --   end,
  -- },
}
