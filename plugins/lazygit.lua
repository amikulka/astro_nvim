return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open lazygit" },
      { "<leader>gf", "<cmd>LazyGitCurrentFile<CR>", desc = "Open lazygit for current file" },
    },
  },
}
