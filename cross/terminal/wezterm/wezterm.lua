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
    return "Japanesque"
  else
    return "Tokyo Night Light (Gogh)"
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
config.window_decorations = "RESIZE"

-- "INTEGRATED_BUTTONS"
--"RESIZE"
--config.window_decorations = "NONE"

config.hide_tab_bar_if_only_one_tab = true

config.automatically_reload_config = true

----------------------

local scheme_names = {}
for name, scheme in pairs(wezterm.color.get_builtin_schemes()) do
  table.insert(scheme_names, name)
end

wezterm.on('window-config-reloaded', function(window, pane)
  if window:get_config_overrides() then return end
  local scheme = scheme_names[math.random(#scheme_names)]
  window:set_config_overrides { color_scheme = scheme }
end)

----------------------

config.window_background_opacity = 0.9

----------------------

wezterm.on('update-status', function(window)
  -- Grab the utf8 character for the "powerline" left facing
  -- solid arrow.
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Grab the current window's configuration, and from it the
  -- palette (this is the combination of your chosen colour scheme
  -- including any overrides).
  local color_scheme = window:effective_config().resolved_palette
  local bg = color_scheme.background
  local fg = color_scheme.foreground

  window:set_right_status(wezterm.format({
    -- First, we draw the arrow...
    { Background = { Color = 'none' } },
    { Foreground = { Color = bg } },
    { Text = SOLID_LEFT_ARROW },
    -- Then we draw our text
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = ' ' .. wezterm.hostname() .. ' ' },
  }))
end)

----------------------

--config.disable_default_key_bindings = true

config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }

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
-- OS specific configs
----------------------

-- mac
if (wezterm.target_triple == 'x86_64-apple-darwin' or wezterm.target_triple == 'arch64-apple-darwin') then

  config.native_macos_fullscreen_mode = false
  config.window_decorations = 'MACOS_FORCE_SQUARE_CORNERS'

  config.macos_window_background_blur = 30

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
