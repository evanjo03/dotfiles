local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.default_prog = { "/bin/zsh", "-c", "/opt/homebrew/bin/tmux attach-session -t notes || /opt/homebrew/bin/tmux" }

-- color scheme
config.color_scheme = "Kanagawa (Gogh)"

-- Change the font
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16

-- appearance
config.hide_tab_bar_if_only_one_tab = true
config.max_fps = 120

return config
