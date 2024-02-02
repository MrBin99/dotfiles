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
config.color_scheme = 'OneDark (base16)'
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
config.enable_tab_bar = false

-- -------------------------------------------------------------------------- --

-- Window.
config.window_close_confirmation = 'NeverPrompt'

-- -------------------------------------------------------------------------- --

-- Keybindings.
config.keys = {
  {
    key = 'w',
    mods = 'CTRL',
    action = action.CloseCurrentTab { confirm = false },
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

return config
