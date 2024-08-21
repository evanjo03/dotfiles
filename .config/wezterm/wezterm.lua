-- Pull in the wezterm API
local wezterm = require("wezterm")

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
-- config.color_scheme = "Nightfly (Gogh)"
-- config.color_scheme = "Tokyo Night (Gogh)"
-- config.color_scheme = "Vs Code Dark+ (Gogh)"
-- config.color_scheme = "nightfox"
config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "Catppuccin Frappé (Gogh)"
-- config.color_scheme = "Catppuccin Macchiato (Gogh)"
-- config.color_scheme = "Catppuccin Mocha (Gogh)"
-- config.color_scheme = "Night Owl (Gogh)"

-- Change the font
-- config.font = wezterm.font("MesloLGS Nerd Font")
-- config.font = wezterm.font("Hack Nerd Font")

-- config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font = wezterm.font("FiraCode Nerd Font")
-- config.font = wezterm.font("FiraMono Nerd Font")
--
config.font_size = 16

config.hide_tab_bar_if_only_one_tab = true

-- Change the bg opacity:
-- config.window_background_opacity = 0.80
-- config.window_decorations = "RESIZE"

-- config.window_padding = {
-- 	left = 0,
-- 	right = 0,
-- 	top = 0,
-- 	bottom = 0,
-- }

-- config.background = {
--
-- local dimmer = { brightness = 0.1 }
--
-- config.enable_scroll_bar = true
-- config.min_scroll_bar_height = "2cell"
-- config.colors = {
-- 	scrollbar_thumb = "white",
-- }
-- config.background = {
-- 	-- This is the deepest/back-most layer. It will be rendered first
-- 	{
-- 		source = {
-- 			File = "/Users/john.evans/Pictures/bg/Fxjleil.png",
-- 		},
-- 		-- The texture tiles vertically but not horizontally.
-- 		-- When we repeat it, mirror it so that it appears "more seamless".
-- 		-- An alternative to this is to set `width = "100%"` and have
-- 		-- it stretch across the display
-- 		repeat_x = "Mirror",
-- 		hsb = dimmer,
-- 		-- When the viewport scrolls, move this layer 10% of the number of
-- 		-- pixels moved by the main viewport. This makes it appear to be
-- 		-- further behind the text.
-- 		attachment = { Parallax = 0.1 },
-- 	},
-- }

-- and finally, return the configuration to wezterm
return config
