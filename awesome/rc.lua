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

beautiful.init(config_path .. "theme.lua")

local nice = require("nice")
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
require("widgets.topbar")
--require("widgets.sideBar")
require("widgets.desktopBackground")

-- start things!
awful.spawn(variables.picom)
awful.spawn(variables.ulauncher)

awful.tag.add("primary", {
  screen = s,
  layout = awful.layout.suit.floating,
  selected = true,
})