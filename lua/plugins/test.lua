return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/neotest-jest',
      'marilari88/neotest-vitest',
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local neotest = require 'neotest'

      vim.keymap.set('n', '<leader>tn', function()
        neotest.run.run()
      end, { desc = 'Run nearest test' })

      vim.keymap.set('n', '<leader>tf', function()
        neotest.run.run(vim.fn.expand '%')
      end, { desc = 'Run all tests in file' })

      vim.keymap.set('n', '<leader>ts', function()
        neotest.summary.toggle()
      end, { desc = 'Toggle test summary panel' })

      vim.keymap.set('n', '<leader>to', function()
        neotest.output.open { enter = true, auto_close = true }
      end, { desc = 'Open test output' })

      vim.keymap.set('n', '<leader>tl', function()
        neotest.run.run_last()
      end, { desc = 'Run last test' })

      vim.keymap.set('n', '<leader>td', function()
        neotest.run.run { strategy = 'dap' }
      end, { desc = 'Debug nearest test' }) -- se estiver usando DAP

      neotest.setup {
        adapters = {
          require 'neotest-jest' {
            jestCommand = 'npm test --', -- or "yarn test --", or "pnpm test --"
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          },
          require 'neotest-vitest' {
            -- Optional: customize the command if needed
            -- vitestCommand = "npx vitest run",
          },
        },
      }
    end,
  },
}
