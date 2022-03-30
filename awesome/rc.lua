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

-- import widgets
require("widgets.sideBar")
