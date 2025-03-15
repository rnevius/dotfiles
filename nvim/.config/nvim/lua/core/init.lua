-- Core configuration loader
-- Loads all core modules
-- Defines global variables

-- Set <space> as the leader key
-- NOTE: Must happen before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Copilot settings
vim.g.copilot_no_tab_map = true

-- Load core modules
require 'core.options'
require 'core.keymaps'
require 'core.autocmds'
