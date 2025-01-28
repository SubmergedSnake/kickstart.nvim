return {
  'nat-418/boole.nvim',
  config = function()
    require('boole').setup {
      mappings = {
        increment = '<C-a>',
        decrement = '<C-x>',
      },
      additions = {
        { 'left', 'right' },
        { 'up', 'down' },
        { 'top', 'bottom' },
        { '===', '!==' },
      },
    }
  end,
}
