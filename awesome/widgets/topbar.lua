local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local gears = require("gears")

local systemMenu = require("widgets.widgets.systemMenu")
local clock = require("widgets.widgets.clock")

--
-- ─── Widgets ─────────────────────────────────────────────────────────────────
--

local wb = awful.wibar {
  height = 28,
  position = "top"
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
    clock,
  }
}
