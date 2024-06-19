local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.audible_bell = "Disabled"
config.check_for_updates = false
config.color_scheme = 'nord'
config.enable_scroll_bar = false
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.hide_tab_bar_if_only_one_tab = true
config.max_fps = 120
config.mouse_wheel_scrolls_tabs = false
config.warn_about_missing_glyphs = false
config.window_close_confirmation = 'NeverPrompt'

if wezterm.target_triple == 'aarch64-apple-darwin' then
  config.font_size = 13
  config.native_macos_fullscreen_mode = true
end

if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  config.font_size = 10
end

return config
