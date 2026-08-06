-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.default_prog = { "/bin/zsh", "-c", "/opt/homebrew/bin/tmux attach-session -t notes || /opt/homebrew/bin/tmux" }

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "One Dark (Gogh)"
-- config.color_scheme = "Nightfly (Gogh)"
-- config.color_scheme = "Tokyo Night (Gogh)"
-- config.color_scheme = "Vs Code Dark+ (Gogh)"
-- config.color_scheme = "nightfox"
-- config.color_scheme = "Everforest Dark (Gogh)"
-- config.color_scheme = "nord"
-- config.color_scheme = "Kanagawa (Gogh)"
config.color_scheme = "Catppuccin Frappé (Gogh)"
-- config.color_scheme = "Catppuccin Macchiato (Gogh)"
-- config.color_scheme = "Catppuccin Mocha (Gogh)"
-- config.color_scheme = "Night Owl (Gogh)"
-- Change the font
-- config.font = wezterm.font("MesloLGS Nerd Font")
-- config.font = wezterm.font("Hack Nerd Font")

-- config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.font = wezterm.font("Monaspace Neon NF")
config.font = wezterm.font("FiraCode Nerd Font")
-- config.font = wezterm.font("FiraMono Nerd Font")
--
config.font_size = 16

config.hide_tab_bar_if_only_one_tab = true

config.max_fps = 120

-- Local multiplexing: a persistent mux server that keeps panes/tabs
-- alive even if the GUI window is closed. Attach to it by launching
-- wezterm normally (default_gui_startup_args below auto-connects),
-- or run `wezterm connect unix` from a terminal.
config.unix_domains = {
	{ name = "unix" },
}
config.default_gui_startup_args = { "connect", "unix" }

-- Leader key mirrors tmux's prefix (Ctrl-a). Press Ctrl-a, then the
-- follow-up key within 1s, just like tmux.
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

-- Helper for vim-tmux-navigator-style pane switching: forward Ctrl-hjkl to
-- the running program if it's (n)vim, otherwise move focus to the adjacent pane.
local function smart_pane_nav(vim_key, direction)
	return wezterm.action_callback(function(window, pane)
		local process = pane:get_foreground_process_name() or ""
		if process:find("[nN]?vim") then
			window:perform_action(
				wezterm.action.SendKey { key = vim_key, mods = "CTRL" },
				pane
			)
		else
			window:perform_action(wezterm.action.ActivatePaneDirection(direction), pane)
		end
	end)
end

-- Pane/tab keybindings (multiplexing controls), matched to ~/.tmux.conf
config.keys = {
	-- split panes: tmux `|` = horizontal split, `-` = vertical split
	{ key = "|", mods = "LEADER|SHIFT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
	{ key = "-", mods = "LEADER", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },

	-- reload config: tmux `prefix + r`
	{ key = "r", mods = "LEADER", action = wezterm.action.ReloadConfiguration },

	-- zoom pane: tmux `prefix + m`
	{ key = "m", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },

	-- "detach": tmux `prefix + d` detaches the client but leaves the
	-- session running. Equivalent here is quitting the GUI client — the
	-- wezterm-mux-server process (and all panes/tabs) keeps running
	-- independently, since it's a separate process from the GUI window.
	{ key = "d", mods = "LEADER", action = wezterm.action.QuitApplication },

	-- kill/delete pane: tmux default `prefix + x` (unmodified in your config)
	{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane { confirm = true } },

	-- pane navigation: mirrors vim-tmux-navigator, which only steals bare
	-- Ctrl-h/j/k/l when the focused pane is running (n)vim; otherwise it
	-- passes the keystroke through (so shell backspace/linefeed still work)
	{ key = "h", mods = "CTRL", action = smart_pane_nav("h", "Left") },
	{ key = "j", mods = "CTRL", action = smart_pane_nav("j", "Down") },
	{ key = "k", mods = "CTRL", action = smart_pane_nav("k", "Up") },
	{ key = "l", mods = "CTRL", action = smart_pane_nav("l", "Right") },

	-- resize panes: tmux `prefix + h/j/k/l` (repeatable, no re-press of prefix needed)
	{ key = "h", mods = "LEADER", action = wezterm.action.ActivateKeyTable { name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 } },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivateKeyTable { name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 } },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivateKeyTable { name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 } },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivateKeyTable { name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 } },
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = wezterm.action.AdjustPaneSize { "Left", 5 } },
		{ key = "j", action = wezterm.action.AdjustPaneSize { "Down", 6 } },
		{ key = "k", action = wezterm.action.AdjustPaneSize { "Up", 5 } },
		{ key = "l", action = wezterm.action.AdjustPaneSize { "Right", 5 } },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- enter copy mode: tmux `prefix + [`
table.insert(config.keys, { key = "[", mods = "LEADER", action = wezterm.action.ActivateCopyMode })

-- vi-style copy mode selection: tmux `v` begin-selection, `y` copy-selection + exit.
-- (WezTerm's built-in copy_mode defaults already provide vi-style hjkl/w/b
-- navigation; these entries are merged on top, overriding just v/y.)
config.key_tables.copy_mode = {
	{ key = "v", mods = "NONE", action = wezterm.action.CopyMode { SetSelectionMode = "Cell" } },
	{
		key = "y",
		mods = "NONE",
		action = wezterm.action.Multiple {
			{ CopyTo = "ClipboardAndPrimarySelection" },
			{ CopyMode = "Close" },
		},
	},
}
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
-- 	-- 	-- This is the deepest/back-most layer. It will be rendered first
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
--
-- and finally, return the configuration to wezterm
return config
