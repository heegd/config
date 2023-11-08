-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- For example, changing the color scheme:
config.color_scheme = 'nord'
config.font = wezterm.font('JetBrainsMono Nerd Font', {weight = 'DemiBold'})
config.font_size = 13

config.enable_scroll_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.window_close_confirmation = 'NeverPrompt'

-- and finally, return the configuration to wezterm
return config
