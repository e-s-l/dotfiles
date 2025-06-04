-- Prelim's

------------
-- Functions
------------

-- returns color scheme dependant on operating system theme setting (dark/light)
local function color_scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Japanesque"
  else
    return "Japanesque"-- "Tokyo Night Light (Gogh)"
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

config.automatically_reload_config = true

-- Misc.

config.pane_focus_follows_mouse = true

-- Font

local primary_font = 'Inconsolata'
local secondary_font = 'JetBrainsMono Nerd Font'

config.font = wezterm.font_with_fallback {
  primary_font,
  secondary_font,
}
-- config.font = wezterm.font 'JetBrainsMono Nerd Font'

config.font_size = 12.0


-- Tabbar

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true


-- Doesn't want to work...
--config.window_frame = {
--  font = wezterm.font secondary_font,
--  font_size = 12,
--}

-- Padding

config.window_padding = {
  left = '2cell',
  right = '2cell',
  top = '1cell',
  bottom = '1cell',
}

-- Cursor

config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Linear"

-- Colours

config.color_scheme = color_scheme_for_appearance(wezterm.gui.get_appearance())

-- Bells

----

----------------------
-- OS specific configs
----------------------

-- mac
if (wezterm.target_triple == 'x86_64-apple-darwin' or wezterm.target_triple == 'arch64-apple-darwin') then

  config.native_macos_fullscreen_mode = false
  config.window_decorations = 'MACOS_FORCE_SQUARE_CORNERS'

else

  config.window_decorations = "NONE"
  -- "RESIZE" --"INTEGRATED_BUTTONS"

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
