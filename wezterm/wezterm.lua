-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font 'Fira Code'
config.color_scheme = 'Gruvbox Dark (Gogh)'
config.colors = {
    tab_bar = {
        active_tab = {
            bg_color = '#282828',
            fg_color = '#ebdbb2'
        },
    }
}
config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = '+',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(0),
  },
  {
    key = '[',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(1),
  },
  {
    key = '{',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(2),
  },
  {
    key = '(',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = '&',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = '=',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(5),
  },
  {
    key = ')',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(6),
  },
  {
    key = '}',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(7),
  },
  {
    key = ']',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(8),
  },
  {
    key = '*',
    mods = 'CMD',
    action = wezterm.action.ActivateTab(9),
  },
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action.ActivateTabRelative(1),
  },
}
-- and finally, return the configuration to wezterm
return config
