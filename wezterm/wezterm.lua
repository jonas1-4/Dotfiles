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

-- Zenmod 
local function get_current_working_dir(tab)
  local current_dir = tab.active_pane.current_working_dir or ''
  local HOME_DIR = string.format('file://%s', os.getenv('HOME'))

  return current_dir == HOME_DIR and '.' or string.gsub(current_dir, '(.*[/\\])(.*)', '%2')
end

local function get_process(tab)
  if not tab.active_pane or tab.active_pane.foreground_process_name == '' then
    return '[?]'
  end

  local process_name = string.gsub(tab.active_pane.foreground_process_name, '(.*[/\\])(.*)', '%2')
  if string.find(process_name, 'kubectl') then
    process_name = 'kubectl'
  end

  return process_icons[process_name] or string.format('[%s]', process_name)
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local has_unseen_output = false
  if not tab.is_active then
    for _, pane in ipairs(tab.panes) do
      if pane.has_unseen_output then
        has_unseen_output = true
        break
      end
    end
  end

  local cwd = wezterm.format({
    { Attribute = { Intensity = 'Bold' } },
    { Text = get_current_working_dir(tab) },
  })

  local title = string.format(' %s ~ %s  ', get_process(tab), cwd)

  if has_unseen_output then
    return {
      { Foreground = { Color = '#28719c' } },
      { Text = title },
    }
  end

  return {
    { Text = title },
  }
end)e
wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)
-- and finally, return the configuration to wezterm
return config
