--
-- Added some snippets to adapt from:
-- https://alexplescan.com/posts/2024/08/10/wezterm/
--

-- Prelim's

------------
-- Functions
------------

-- returns color scheme dependant on operating system theme setting (dark/light)
local function color_scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Mikazuki (terminal.sexy)"
  else
    return "Japanesque"       --"Tokyo Night Light (Gogh)"
  end
end

-------
-- Init
-------

--
local config = {}

-- Wezterm API:
local wezterm = require 'wezterm'

---------
-- Config
---------

config.window_frame = {
		font = require("wezterm").font({ family = "Inconsolata" }),
		font_size = 12,
}

----------------

-- debug events

-- config.debug_key_events = true

----------------

config.pane_focus_follows_mouse = true

-- config.font = wezterm.font 'JetBrainsMono Nerd Font'

config.font = wezterm.font_with_fallback {
	'Inconsolata',
	'JetBrainsMono Nerd Font',
}

config.font_size = 12.0

--
config.color_scheme = color_scheme_for_appearance(wezterm.gui.get_appearance())

--
--config.window_decorations = "RESIZE"

-- "INTEGRATED_BUTTONS"
--"RESIZE"
--config.window_decorations = "NONE"

config.hide_tab_bar_if_only_one_tab = true

config.automatically_reload_config = true


----------------------

config.window_background_opacity = 0.95

----------------------

-- config.disable_default_key_bindings = true

config.leader = { key = 'a', mods = 'CMD', timeout_milliseconds = 1000 }

config.keys = {

  -- Sends ESC + b and ESC + f sequence, which is used
  -- for telling your shell to jump back/forward.
  {
    -- When the left arrow is pressed
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bb',
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bf',
  },
  {
    key = ',',
    mods = 'SUPER',
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.home_dir,
      args = { 'nvim', wezterm.config_file },
    },
  },
   {
    key = '"',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '%',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'j', -- or DownArrow
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection('Down'),
  },
  {
    key = 'k', -- or UpArrow
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection('Up'),
  },
  {
    key = 'h', -- or LeftArrow
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection('Left'),
  },
  {
    key = 'l', -- or RightArrow
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection('Right'),
  },
}
----------------------

config.initial_cols = 120
config.initial_rows = 40

----------------------
-- OS specific configs
----------------------

-- mac
if (wezterm.target_triple == 'x86_64-apple-darwin' or wezterm.target_triple == 'aarch64-apple-darwin') then

  config.native_macos_fullscreen_mode = false

  config.window_decorations = "RESIZE"
  config.window_decorations = 'MACOS_FORCE_SQUARE_CORNERS'

  config.macos_window_background_blur = 30
  -- config.disable_default_key_bindings = true

else

  config.window_decorations = "NONE"

  -- windows
  if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { "pwsh.exe" }
  end

  -- linux
  if (wezterm.target_triple == "x86_64-unknown-linux-gnu") then
    -- hmmmm
  end

end

return config
