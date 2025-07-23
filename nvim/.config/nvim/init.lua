-- Main entry point for Neovim configuration

-- Load core configuration
require 'core'

-- Load plugins
require 'plugins'

-- Neovide specific settings
if vim.g.neovide then
  vim.o.guifont = 'MesloLGS NF:h13.5'
  vim.o.guifontwide = 'MesloLGS NF:h13.5'
  vim.o.linespace = 2

  vim.g.neovide_cursor_animation_length = 0.03
end

-- vim: ts=2 sts=2 sw=2 et
