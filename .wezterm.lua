-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'nord'
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.harfbuzz_features = { "calt", "clig", "liga" }

-- config.keys = {
--   {
--     key = 's',
--     mods = 'CTRL|SHIFT',
--     action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
--   },
--   {
--     key = 'v',
--     mods = 'CTRL|SHIFT',
--     action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
--   },
--   {
--     key = 'h',
--     mods = 'CTRL|SHIFT',
--     action = wezterm.action.ActivatePaneDirection("Left")
--   },
--   {
--     key = 'j',
--     mods = 'CTRL|SHIFT',
--     action = wezterm.action.ActivatePaneDirection("Down")
--   },
--   {
--     key = 'k',
--     mods = 'CTRL|SHIFT',
--     action = wezterm.action.ActivatePaneDirection("Up")
--   },
--   {
--     key = 'l',
--     mods = 'CTRL|SHIFT',
--     action = wezterm.action.ActivatePaneDirection("Right")
--   },
--   {
--     key = 'q',
--     mods = 'CTRL|SHIFT',
--     action = wezterm.action.CloseCurrentPane({ confirm = false })
--   },
--   {
--     key = '|',
--     mods = 'CTRL|SHIFT',
--     action = wezterm.action.TogglePaneZoomState
--   }
-- }

config.enable_scroll_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_close_confirmation = 'NeverPrompt'

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.font_size = 10
end

if wezterm.target_triple == 'x86_64-apple-darwin' then
  config.font_size = 13
  config.native_macos_fullscreen_mode = true
end

if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  config.font_size = 10
end

-- and finally, return the configuration to wezterm
return config
