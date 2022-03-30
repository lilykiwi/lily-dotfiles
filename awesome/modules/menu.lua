local awful = require("awful")
local beautiful = require("beautiful")

-- {{{ Menu
-- Create a launcher widget and a main menu

local mainmenu = awful.menu({
  items = { --
  {"hotkeys", function()
    hotkeys_popup.show_help(nil, awful.screen.focused())
  end}, --
  {"manual", terminal .. " -e man awesome"}, --
  {"edit config", editor .. " " .. awesome.conffile}, --
  {"restart", awesome.restart}, --
  {"open terminal", terminal}}
})

Launcher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = mainmenu
})
-- }}}
