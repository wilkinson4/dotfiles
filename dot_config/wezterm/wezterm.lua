local wezterm = require 'wezterm';

local act = wezterm.action;
return {
  font = wezterm.font("FiraMono Nerd Font Medium"),
  color_scheme = "duskfox",
  -- window_background_opacity = 0.8,
  enable_tab_bar = false,
  keys = {
    -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
    {
      key = 'LeftArrow',
      mods = 'OPT',
      action = act.SendKey {
        key = 'b',
        mods = 'ALT',
      },
    },
    {
      key = 'RightArrow',
      mods = 'OPT',
      action = act.SendKey { key = 'f', mods = 'ALT' },
    },

    {
      key = 'LeftArrow',
      mods = 'CMD',
      action = act { SendString = "\x1bOH" },
    },
    {
      key = 'RightArrow',
      mods = 'CMD',
      action = act { SendString = "\x1bOF" },
    },
    { key = "Backspace", mods = 'CMD', action = act.SendString("\x15") },
    -- Disable fullscreen shortcut
    { key = "Enter",     mods = "ALT", action = act.SendKey { key = "Enter", mods = "ALT" } },
  },
  mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
    },
  }
}
