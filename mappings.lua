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
    ["<leader>bn"] = {
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
    ["<leader>Y"] = { '"+Y', desc = "Copy line to system clipboard" },

    ["<leader>d"] = { '"_d', desc = "Delete without yanking" },
    ["<leader>D"] = { '"_D', desc = "Delete rest of line without yanking" },

    ["Q"] = { "<nop>" },

    ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Search and replace" },

    ["<leader>gt"] = { function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle Git blame" },

    -- get rid of new file mapping - I don't like
    ["<leader>n"] = false,
    ["<leader>pi"] = false,
    ["<leader>ps"] = false,
    ["<leader>pS"] = false,
    ["<leader>pu"] = false,
    ["<leader>pU"] = false,

    ["<leader>pa"] = false,
    ["<leader>pA"] = false,
    ["<leader>pv"] = false,
    ["<leader>pl"] = false,

    ["<leader>pm"] = false,
    ["<leader>pM"] = false,
    ["<leader>h"] = false,

    ["<leader> pp"] = { '"+p', desc = "Paste from system clipboard" },

    ["<leader>?"] = { function() require("cheatsheet").show_cheatsheet() end, desc = "Open cheatsheet" },

    ["<D-v"] = { '"+p', desc = "Paste from system clipboard" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv" },
    ["K"] = { ":m '<-2<CR>gv=gv" },

    ["<leader>y"] = { '"+y', desc = "Copy to system clipboard" },
    ["<leader>d"] = { '"_d', desc = "Delete without yanking" },
    ["<D-c"] = { '"+y', desc = "Copy to system clipboard" },
    ["<D-v"] = { '"+p', desc = "Paste from system clipboard" },
  },
  t = {
    -- setting a mapping to false will disable it
    --
    -- ["<esc>"] = false,
  },
  x = {
    ["<leader>pk"] = { '"_dp', desc = "Don't loose yank when pasting" },
    ["<D-v"] = { '"+p', desc = "Paste from system clipboard" },
  },
}
--   maps.n["<leader>d"] = sections.d
--   maps.v["<leader>d"] = sections.d
--   -- modified function keys found with `showkey -a` in the terminal to get key code
--   -- run `nvim -V3log +quit` and search through the "Terminal info" in the `log` file for the correct keyname
--   maps.n["<F5>"] = { function() require("dap").continue() end, desc = "Debugger: Start" }
--   maps.n["<F17>"] = { function() require("dap").terminate() end, desc = "Debugger: Stop" } -- Shift+F5
--   maps.n["<F21>"] = { -- Shift+F9
--     function()
--       vim.ui.input({ prompt = "Condition: " }, function(condition)
--         if condition then require("dap").set_breakpoint(condition) end
--       end)
--     end,
--     desc = "Debugger: Conditional Breakpoint",
--   }
--   maps.n["<F29>"] = { function() require("dap").restart_frame() end, desc = "Debugger: Restart" } -- Control+F5
--   maps.n["<F6>"] = { function() require("dap").pause() end, desc = "Debugger: Pause" }
--   maps.n["<F9>"] = { function() require("dap").toggle_breakpoint() end, desc = "Debugger: Toggle Breakpoint" }
--   maps.n["<F10>"] = { function() require("dap").step_over() end, desc = "Debugger: Step Over" }
--   maps.n["<F11>"] = { function() require("dap").step_into() end, desc = "Debugger: Step Into" }
--   maps.n["<F23>"] = { function() require("dap").step_out() end, desc = "Debugger: Step Out" } -- Shift
--   maps.n["<leader>db"] = { function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint (F9)" }
--   maps.n["<leader>dB"] = { function() require("dap").clear_breakpoints() end, desc = "Clear Breakpoints" }
--   maps.n["<leader>dc"] = { function() require("dap").continue() end, desc = "Start/Continue (F5)" }
--   maps.n["<leader>dC"] = {
--     function()
--       vim.ui.input({ prompt = "Condition: " }, function(condition)
--         if condition then require("dap").set_breakpoint(condition) end
--       end)
--     end,
--     desc = "Conditional Breakpoint (S-F9)",
--   }
--   maps.n["<leader>di"] = { function() require("dap").step_into() end, desc = "Step Into (F11)" }
--   maps.n["<leader>do"] = { function() require("dap").step_over() end, desc = "Step Over (F10)" }
--   maps.n["<leader>dO"] = { function() require("dap").step_out() end, desc = "Step Out (S-F11)" }
--   maps.n["<leader>dq"] = { function() require("dap").close() end, desc = "Close Session" }
--   maps.n["<leader>dQ"] = { function() require("dap").terminate() end, desc = "Terminate Session (S-F5)" }
--   maps.n["<leader>dp"] = { function() require("dap").pause() end, desc = "Pause (F6)" }
--   maps.n["<leader>dr"] = { function() require("dap").restart_frame() end, desc = "Restart (C-F5)" }
--   maps.n["<leader>dR"] = { function() require("dap").repl.toggle() end, desc = "Toggle REPL" }
--   maps.n["<leader>ds"] = { function() require("dap").run_to_cursor() end, desc = "Run To Cursor" }
--
--   if is_available "nvim-dap-ui" then
--     maps.n["<leader>dE"] = {
--       function()
--         vim.ui.input({ prompt = "Expression: " }, function(expr)
--           if expr then require("dapui").eval(expr, { enter = true }) end
--         end)
--       end,
--       desc = "Evaluate Input",
--     }
--     maps.v["<leader>dE"] = { function() require("dapui").eval() end, desc = "Evaluate Input" }
--     maps.n["<leader>du"] = { function() require("dapui").toggle() end, desc = "Toggle Debugger UI" }
--     maps.n["<leader>dh"] = { function() require("dap.ui.widgets").hover() end, desc = "Debugger Hover" }
--   end
-- end
-- d = { desc = get_icon("Debugger", 1, true) .. "Debugger" },
