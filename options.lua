-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    wrap = false, -- sets vim.opt.wrap
    tabstop = 4, -- sets vim.opt.tabstop
    title = false,
    softtabstop = 4, -- sets vim.opt.softtabstop,
    shiftwidth = 4, -- sets vim.opt.shiftwidthshi
    smartindent = true, -- sets vim.opt.smartindent
    swapfile = false, -- sets vim.opt.swapfile
    undofile = true, -- sets vim.opt.undofile
    backup = false, -- sets vim.opt.backup
    undodir = os.getenv "HOME" .. "/.vim/undodir", -- sets vim.opt.undodir
    scrolloff = 15, -- sets vim.opt.scrolloffroll
    colorcolumn = "100", -- sets vim.opt.colorcolumn
    clipboard = "", -- connection to the system clipboard
    fillchars = { eob = "~" }, -- disable `~` on nonexistent lines
    cmdheight = 0, -- hide command line unless needed
    showmode = true, -- disable showing modes in command line
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
    lazygit_use_custom_config_file_path = 1,
    lazygit_config_file_path = "~/.config/lazygit/config.yml",
    lazygit_floating_window_winblend = 6,
    lazygit_floating_window_use_plenary = 1,
    lazygit_floating_window_scaling_factor = 0.8,
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
