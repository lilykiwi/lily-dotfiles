local awful = require("awful")
local beautiful = require("beautiful")
local variables = require("modules.variables")

-- {{{ Menu
-- Create a launcher widget and a main menu

local mainmenu = awful.menu({
  items = { --
  {"manual", variables.terminal .. " -e man awesome"}, --
  {"edit config", variables.editor .. " " .. awesome.conffile}, --
  {"restart", awesome.restart}, --
  {"open terminal", variables.terminal}},
  {"launch picom", variables.picom}
})

Launcher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = mainmenu
})
-- }}}
