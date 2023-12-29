-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- navigate buffer tabs with `H` and `L`
    ["<C-n>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<C-p>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },

    ["J"] = { "mzJ`z" }, -- Join lines while keeping cursor position
    ["<C-d>"] = { "<C-d>zz" }, -- Scroll down while keeping cursor in center of screen
    ["<C-u>"] = { "<C-u>zz" }, -- Scroll up while keeping cursor in center of screem
    ["N"] = { "Nzzzv" }, -- goes to previous match and centers screen
    ["n"] = { "nzzzv" }, -- goes to next match and centers screen

    ["<leader>y"] = { '"+y', desc = "Copy to system clipboard" },
    ["<leader>Y"] = { '"+Y', desc = "Copy rest of line to system clipboard" },

    ["<leader>d"] = { '"_d', desc = "Delete without yanking" },
    ["<leader>D"] = { '"_D', desc = "Delete rest of line without yanking" },

    ["Q"] = { "<nop>" },

    ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Search and replace" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv" },
    ["K"] = { ":m '<-2<CR>gv=gv" },

    ["<leader>y"] = { '"+y', desc = "Copy to system clipboard" },
    ["<leader>d"] = { '"_d', desc = "Delete without yanking" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  x = {
    ["<leader>p"] = { '"_dp', desc = "Don't loose yank when pasting" },
  },
}
