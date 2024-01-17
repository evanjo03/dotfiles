-- Pull in the wezterm API
local wezterm = require("wezterm")

local dimmer = { brightness = 0.1 }
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "One Dark (Gogh)"
-- config.color_scheme = "Nightfly"
-- config.color_scheme = "Tokyo Night (Gogh)"
-- config.color_scheme = "Vs Code Dark+ (Gogh)"
config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Night Owl (Gogh)"

-- Change the font
-- config.font = wezterm.font("MesloLGS Nerd Font")
config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.font = wezterm.font("FiraCode Nerd Font")
-- config.font = wezterm.font("FiraMono Nerd Font")
--
config.font_size = 16

config.hide_tab_bar_if_only_one_tab = true

-- Change the bg opacity:
-- config.window_background_opacity = 0.90
-- config.window_decorations = "RESIZE"

-- config.window_padding = {
-- 	left = 0,
-- 	right = 0,
-- 	top = 0,
-- 	bottom = 0,
-- }

-- config.background = {
--
-- 	{
-- 		source = {
-- 			File = "/Users/john/Downloads/bg.jpeg",
-- 		},
-- 		hsb = dimmer,
-- 	},
-- }

-- and finally, return the configuration to wezterm
return config
