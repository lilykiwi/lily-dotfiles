local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local gears = require("gears")

local systemMenu = require("modules.widgets.systemMenu")
local clock = require("modules.widgets.clock")
local sound = require("modules.widgets.sound")

--
-- ─── Widgets ─────────────────────────────────────────────────────────────────
--

local wb = awful.wibar {
  height = 28,
  position = "top",
  bg = "#00000000",
}

local empty = {
  widget  = wibox.container.background
}

--
-- ─── Setup ───────────────────────────────────────────────────────────────────
--

wb:setup {
  layout = wibox.layout.align.horizontal,
  {
    layout = wibox.layout.fixed.horizontal,
    systemMenu
  },
  empty,
  {
    layout = wibox.layout.fixed.horizontal,
    sound,
    clock,
  }
}
