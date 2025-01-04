vim.cmd("language en_US")
vim.g.mapleader = '\\'
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

-- Set the highlight group for the cursor line
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#2e2e2e' })  -- Change the color as needed

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 0
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},
"itchyny/lightline.vim",
"nvim-telescope/telescope.nvim",
"folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
{
"nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
},
"williamboman/mason.nvim",
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("mason").setup()

vim.cmd[[colorscheme tokyonight-night]]

--require'lspconfig'.lua_ls.setup{}
