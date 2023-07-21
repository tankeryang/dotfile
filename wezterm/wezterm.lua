local wezterm = require("wezterm")
return {
	default_prog = { "zsh" },
	font = wezterm.font({
		family = "JetBrains Mono Nerd Font",
		weight = "Bold",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	}),
	font_size = 8.0,
	-- color_scheme = "Banana Blueberry",
	color_scheme = "Atelier Cave (base16)",
}
