local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.default_prog = { "/bin/zsh", "-c", "/opt/homebrew/bin/tmux attach-session -t notes || /opt/homebrew/bin/tmux" }

-- color scheme
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "Catppuccin Frappé (Gogh)"
config.color_scheme = "Vs Code Dark+ (Gogh)"
-- config.color_scheme = "nordfox"
-- config.color_scheme = "terafox"
-- config.color_scheme = "Night Owl (Gogh)"

-- Change the font
config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.font = wezterm.font("FiraCode Nerd Font")
-- config.font = wezterm.font("Iosevka Nerd Font")
-- config.font = wezterm.font("VictorMono Nerd Font")

config.font_size = 16

-- appearance
config.hide_tab_bar_if_only_one_tab = true
config.max_fps = 120
config.window_decorations = "RESIZE"

config.background = {
	{
		source = {
			File = wezterm.config_dir .. "/bg.jpg",
		},
	},
	{
		source = {
			Color = "rgba(28, 33, 39, 0.70)",
		},
		height = "100%",
		width = "100%",
	},
}

return config
