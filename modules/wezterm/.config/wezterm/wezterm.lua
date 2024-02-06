-- -------------------------------------------------------------------------- --
--                       MrBin99 - Wezterm Configuration                      --
--                       https://wezfurlong.org/wezterm/                      --
-- -------------------------------------------------------------------------- --

-- Get wezterm module.
local wezterm = require('wezterm')
local mux = wezterm.mux
local action = wezterm.action
local config = {}

-- Helpers.
local is_running_on_windows = wezterm.target_triple == 'x86_64-pc-windows-msvc'

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- -------------------------------------------------------------------------- --

-- If running on Windows, load WSL.
if is_running_on_windows then
  config.default_domain = 'WSL:Ubuntu'
end

-- -------------------------------------------------------------------------- --

-- Colors and fonts.
local TEXT_COLOR = "#abb2bf"
local BACKGROUND_COLOR = "#181a1f"
local EDITOR_BACKGROUND_COLOR = "#282c34"

config.color_scheme = 'OneDark (base16)'
config.colors = {
  tab_bar = {
    background = BACKGROUND_COLOR,
    active_tab = {
      bg_color = EDITOR_BACKGROUND_COLOR,
      fg_color = TEXT_COLOR,
    },
    inactive_tab = {
      bg_color = '#181a1f',
      fg_color = TEXT_COLOR,
    },
    inactive_tab_hover = {
      bg_color = '#1c1f24',
      fg_color = TEXT_COLOR,
    },
    new_tab = {
      bg_color = '#181a1f',
      fg_color = TEXT_COLOR,
    },
    new_tab_hover = {
      bg_color = '#1c1f24',
      fg_color = TEXT_COLOR,
    },
  },
  split = '#4e5767'
}

config.font_size = 12.0
config.font = wezterm.font_with_fallback {
  {
    family = 'JetBrains Mono',
    weight='Regular',
    italic=false
  },
  {
    family = 'Fira Code',
    weight='Regular',
    italic=false
  },
  {
    family = 'Consolas',
    weight='Regular',
    italic=false
  }
}

-- -------------------------------------------------------------------------- --

-- Tabs.
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = true
config.window_decorations = "INTEGRATED_BUTTONS"

function tab_title(tab_info)
  local title = tab_info.tab_title

  if title and #title > 0 then
    return title
  end

  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = wezterm.truncate_right(
      tab_title(tab), max_width - 2
    )

    return {
      { Text = ' ' .. title .. ' ' },
    }
  end
)

config.inactive_pane_hsb = {
  saturation = 1.0,
  brightness = 1.0,
}

-- -------------------------------------------------------------------------- --

-- Window.
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0.5cell',
  bottom = '0',
}

-- -------------------------------------------------------------------------- --

-- Keybindings.
config.keys = {
  {
    key = 't',
    mods = 'CTRL',
    action = action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'w',
    mods = 'CTRL',
    action = action.CloseCurrentTab { confirm = false },
  },
  {
    key = 'f',
    mods = 'CTRL',
    action = action.Search { CaseInSensitiveString = '' },
  },
  {
    key = 'ù',
    mods = 'CTRL',
    action = action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'm',
    mods = 'CTRL',
    action = action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL',
    action = action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CTRL',
    action = action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CTRL',
    action = action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CTRL',
    action = action.ActivatePaneDirection 'Down',
  },
  {
    key = 'LeftArrow',
    mods = 'SHIFT',
    action = action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'RightArrow',
    mods = 'SHIFT',
    action = action.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'UpArrow',
    mods = 'SHIFT',
    action = action.AdjustPaneSize { 'Up', 2 },
  },
  {
    key = 'DownArrow',
    mods = 'SHIFT',
    action = action.AdjustPaneSize { 'Down', 2 },
  },
}

-- -------------------------------------------------------------------------- --

-- Mouse bindings.
config.mouse_bindings = {
  -- Right click to paste.
  {
    event = { Up = { streak = 1, button = 'Right' } },
    mods = "NONE",
    action = action.PasteFrom 'Clipboard',
  },

  -- Open link with CTRL + Left click.
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = action.OpenLinkAtMouseCursor,
  },
}

-- -------------------------------------------------------------------------- --

-- Events.
wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})

  -- Open window maximized.
  window:gui_window():maximize()
end)

-- -------------------------------------------------------------------------- --

return config
