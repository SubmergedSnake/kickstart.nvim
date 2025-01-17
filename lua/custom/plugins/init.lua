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
  -- AERIAL
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('aerial').setup {
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
        end,
      }
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
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
  --GIT
  { 'tpope/vim-fugitive' },

  -- DEBUGGING
  { 'nvim-neotest/nvim-nio' },
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'

      -- Set keymaps to control the debugger
      vim.keymap.set('n', '<F5>', dap.continue)
      vim.keymap.set('n', '<F10>', dap.step_over)
      vim.keymap.set('n', '<F11>', dap.step_into)
      vim.keymap.set('n', '<F12>', dap.step_out)
      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
      vim.keymap.set('n', '<leader>B', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end)
    end,
  },
  { 'microsoft/vscode-js-debug', lazy = true, build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out' },
  {
    'mxsdev/nvim-dap-vscode-js',
    config = function()
      require('dap-vscode-js').setup {
        --  node_path = 'node', -- Path of node executable. Defaults to $NODE_PATH, and then "node"
        debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug', -- Path to vscode-js-debug installation.
        -- debugger_cmd = { 'extension' }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
        adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap
        -- log_file_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug/dap_vscode_js.log', -- Path for file logging
        -- log_file_level = 0, -- Logging level for output to file. Set to false to disable file logging.
        -- log_console_level = vim.log.levels.ERROR, -- Logging level for output to console. Set to false to disable console output.
      }

      local js_based_languages = { 'typescript', 'javascript', 'typescriptreact' }

      for _, language in ipairs(js_based_languages) do
        require('dap').configurations[language] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
          },
          {
            type = 'pwa-chrome',
            request = 'launch',
            name = 'Start Chrome with "localhost"',
            url = 'http://localhost:3000',
            webRoot = '${workspaceFolder}',
            userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
          },
        }
      end
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    requires = { 'mfussenegger/nvim-dap' },
    config = function()
      require('dapui').setup()
      vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '👉', texthl = '', linehl = '', numhl = '' })

      local dap, dapui = require 'dap', require 'dapui'

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open {}
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close {}
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close {}
      end

      vim.keymap.set('n', '<leader>ui', require('dapui').toggle)
    end,
  },

  -- JAVA
  {
    'nvim-java/nvim-java',
  },
}
