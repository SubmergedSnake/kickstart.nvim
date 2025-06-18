-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Nvimtree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')

-- Saving
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save current file' })

-- Args list functionality
vim.keymap.set('n', '<leader>aa', ':arga<CR>', { desc = 'Add this buffer to the args list' })
vim.keymap.set('n', '<leader>ad', ':argd<CR>', { desc = 'Delete this buffer from the args list' })
vim.keymap.set('n', '<leader>al', ':args<CR>', { desc = 'Show the args list' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- CodeCompanion
vim.keymap.set('n', '<leader>tc', ':CodeCompanionChat Toggle<CR>', { desc = 'Toggle CodeCompanion Chat' })
vim.keymap.set('v', '<leader>ex', ':CodeCompanion /explain<CR>', { desc = 'Explain visually selected code' })
vim.keymap.set('n', '<leader>lex', ':CodeCompanion /lsp<CR>', { desc = 'Explain diagnostic error' })
vim.keymap.set('v', '<leader>fix', ':CodeCompanion /fixcode<CR>', { desc = 'Fix visually selected code' })
vim.keymap.set('v', '<leader>gu', ':CodeCompanion /tests<CR>', { desc = 'Generate unit tests for visually selected code' })

-- Cycle through args

-- if we are already editing the first arg, open the last arg
vim.keymap.set('n', '<M-i>', function()
  xpcall(function()
    vim.cmd 'prev'
  end, function()
    vim.cmd 'last'
  end)
end, { desc = 'Prev arg' })

-- if we are already editing the last arg, open the first arg
vim.keymap.set('n', '<M-o>', function()
  xpcall(function()
    vim.cmd 'next'
  end, function()
    vim.cmd 'first'
  end)
end, { desc = 'Next arg' })

-- Buffer management
vim.keymap.set('n', '<C-M-o>', function()
  xpcall(function()
    vim.cmd 'bnext'
  end, function()
    vim.cmd 'bfirst'
  end)
end, { desc = 'Next buffer' })

vim.keymap.set('n', '<C-M-i>', function()
  xpcall(function()
    vim.cmd 'bprevious'
  end, function()
    vim.cmd 'blast'
  end)
end, { desc = 'Brev buffer' })

-- Delete all buffers except this one
vim.keymap.set('n', '<leader>bda', ':%bd|e#<CR>', { desc = 'Delete all the buffers except the current one' })

-- CodeCompanion

vim.cmd [[cab cc CodeCompanion]]
vim.cmd [[cab cce CodeCompanion /explain]]
vim.cmd [[cab ccl CodeCompanion /lsp]]
