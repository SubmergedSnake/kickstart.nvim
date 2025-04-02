return {
  'sam4llis/telescope-arglist.nvim',
  config = function()
    require('telescope').load_extension 'arglist'

    -- Navigate the argument list using Telescope command-line sugar.
    vim.api.nvim_set_keymap('n', '<leader>sa', ':Telescope arglist<CR>', {})
  end,
}
