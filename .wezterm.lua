local wezterm = require 'wezterm'
local config = wezterm.config_builder()
--

config.color_scheme = 'Japanesque'
config.default_prog = { "pwsh.exe" }

--
--
return config
