local wezterm = require 'wezterm';
return {
  font = wezterm.font("NotoMono Nerd Font", { weight = 'Bold' }),
  color_scheme = "ChallengerDeep",
  -- window_background_opacity = 0.8,
  enable_tab_bar = false,
  keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    { key = "LeftArrow",  mods = "OPT", action = wezterm.action { SendString = "\x1bb" } },
    -- Make Option-Right equivalent to Alt-f; forward-word
    { key = "RightArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bf" } },
  }
}
