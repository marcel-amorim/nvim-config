return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = '<C-l>', -- you can customize this
            next = '<C-]>',
            prev = '<C-[>',
            dismiss = '<C-/>',
          },
        },
        panel = {
          enabled = true,
          auto_refresh = true,
        },
      }
    end,
  },
}
