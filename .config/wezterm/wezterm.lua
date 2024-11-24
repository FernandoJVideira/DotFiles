local wezterm = require('wezterm');

local config = wezterm.config_builder()


config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE" -- disable title bar but enable resize border
config.default_cursor_style ="BlinkingBar"
--color_scheme = "Nord (Gogh)",
config.font = wezterm.font("JetBrains Mono", {weight="Bold"})
config.font_size = 12.5
config.window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
}
config.window_background_opacity = 0.70
config.macos_window_background_blur = 20
config.colors = {
    background = "#2A2A28",
    foreground = "#abb2bf",
    cursor_bg = "#abb2bf",
    cursor_fg = "#282c34",
    ansi = {
        "#282c34",
        "#e06c75",
        "#98c379",
        "#e5c07b",
        "#61afef",
        "#c678dd",
        "#56b6c2",
        "#abb2bf",
    },
    brights = {
        "#5c6370",
        "#e06c75",
        "#98c379",
        "#e5c07b",
        "#61afef",
        "#c678dd",
        "#56b6c2",
        "#dcdfe4",
    },
}

return config
