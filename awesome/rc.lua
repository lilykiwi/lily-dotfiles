-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

--import local files
require("modules.variables")
require("modules.rules")
require("modules.keymap")
require("modules.menu")
require("modules.errorHandling")
require("modules.signals")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local variables = require("modules.variables")
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")
local awful = require("awful")
local config_path = gfs.get_configuration_dir()

beautiful.init(config_path .. "theme.lua")

local nice = require("modules.nice")
nice {
  titlebar_height = 22,
  titlebar_font = "Ellograph CF 8",
  win_shade_enabled = false,
  button_size = 12,
  titlebar_radius = 12,
  button_margin_horizontal = 4,
  titlebar_items = {
    left = {"close", "minimize", "floating", "ontop"},
    middle = "title",
    right = ""
  }
}

-- import widgets
require("modules.wibar.topbar")
require("modules.desktopBackground")

-- start things!
awful.spawn(variables.picom)
awful.spawn(variables.ulauncher)

screen.connect_signal("request::desktop_decoration", function (s)
  awful.tag.add("primary", {
    screen = s,
    layout = awful.layout.suit.floating,
    selected = true,
  })
end)

awful.screen.connect_for_each_screen(function(s)
  s.padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
  }
end)