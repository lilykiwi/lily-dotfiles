local awful = require("awful")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.

local variables = {}

-- This is used later as the default terminal and editor to run.
variables.terminal = "kitty"
variables.editor = "code-insiders"
variables.ulauncher = "ulauncher --hide-window --no-window-shadow"
variables.rofi = "ulauncher-toggle"
variables.picom = "picom --xrender-sync-fence"
variables.screenshot = "shotgun $(hacksaw -f '-i %i -g %g') - | xclip -t 'image/png' -selection clipboard"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  awful.layout.suit.floating,
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  -- awful.layout.suit.tile.bottom,
  -- awful.layout.suit.tile.top,
  awful.layout.suit.fair
  -- awful.layout.suit.fair.horizontal,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  -- awful.layout.suit.max,
  -- awful.layout.suit.max.fullscreen,
  -- awful.layout.suit.magnifier,
  -- awful.layout.suit.corner.nw,
  -- awful.layout.suit.corner.ne,
  -- awful.layout.suit.corner.sw,
  -- awful.layout.suit.corner.se,
}

return variables
