-- require('vim._core.ui2').enable()
require('vim._core.ui2').enable {
  enable = true,
  msg = { -- Options related to the message module.
    ---@type 'cmd'|'msg' Default message target, either in the
    ---cmdline or in a separate ephemeral message window.
    ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
    ---or table mapping |ui-messages| kinds and triggers to a target.
    targets = 'cmd',
    cmd = { -- Options related to messages in the cmdline window.
      height = 0.5, -- Maximum height while expanded for messages beyond 'cmdheight'.
    },
    dialog = { -- Options related to dialog window.
      height = 0.5, -- Maximum height.
    },
    msg = { -- Options related to msg window.
      height = 0.5, -- Maximum height.
      timeout = 4000, -- Time a message is visible in the message window.
    },
    pager = { -- Options related to message window.
      height = 0.5, -- Maximum height.
    },
  },
}

-- vim.api.nvim_create_autocmd('LspProgress', {
--   callback = function(ev)
--     vim.print(ev.data)
--     local value = ev.data.params.value
--     vim.api.nvim_echo({ { value.message or 'done' } }, false, {
--       id = 'lsp.' .. ev.data.client_id,
--       kind = 'progress',
--       source = 'vim.lsp',
--       title = value.title,
--       status = value.kind ~= 'end' and 'running' or 'success',
--       percent = value.percentage,
--     })
--   end,
-- })
