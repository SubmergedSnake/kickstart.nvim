-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
-- custom mappings
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')

return {

  -- NVIM TREE
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
    end,
  },

  -- SURROUND
  {
    'tpope/vim-surround',
  },

  -- SNEAK
  { 'justinmk/vim-sneak' },

  -- REPEAT
  {
    'tpope/vim-repeat',
  },
}
