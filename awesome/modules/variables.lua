beautiful = require("beautiful")
awful = require("awful")
gfs = require("gears.filesystem")
config_path = gfs.get_configuration_dir()
theme_path = gfs.get_themes_dir()

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(config_path .. "theme.lua")

local variables = {}

-- This is used later as the default terminal and editor to run.
variables.terminal = "alacritty"
variables.editor = "code-insiders"
variables.ulauncher = "ulauncher --hide-window"
variables.rofi = "rofi -icon-theme 'Colloid-grey-dark' -show drun"
variables.picom = "picom --config " .. config_path .. "config/picom.conf"
variables.escrotum = "escrotum -s -C"

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
