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
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Wezterm API:
local wezterm = require 'wezterm'

---------
-- Config
---------

--
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 12.0

--
config.color_scheme = color_scheme_for_appearance(wezterm.gui.get_appearance())

--
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

----------------------
-- OS specific configs
----------------------

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- windows
  config.default_prog = { "pwsh.exe" }

else if (wezterm.target_triple == 'x86_64-apple-darwin' or wezterm.target_triple == 'arch64-apple-darwin') then
  -- mac
  config.native_macos_fullscreen_mode = false

end


return config
