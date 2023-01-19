local beautiful = require("beautiful")
local awful = require("awful")
local wibox = require("wibox")
local gfs = require("gears.filesystem")
local config_path = gfs.get_configuration_dir()
local theme_path = gfs.get_themes_dir()

local grid = wibox.widget {
  homogeneous   = true,
  spacing       = 5,
  min_cols_size = 10,
  min_rows_size = 10,
  layout        = wibox.layout.grid,
}

local placeholder = wibox.widget {
  markup = "This <i>is</i> a <b>textbox</b>!!!",
  halign = "center",
  valign = "center",
  bg = "#220000",
  widget = wibox.widget.textbox,
}

grid:add_widget_at(placeholder, 2, 1, 1, 2)
grid:add_widget_at(placeholder, 3, 1, 1, 2)
grid:add_widget_at(placeholder , 2, 3, 2, 1)
grid:add_widget_at(placeholder, 4, 1, 1, 1)
grid:add_widget_at(placeholder , 4, 2, 1, 2)

local systemMenu = awful.popup({
  x = 10,
  y = 32,
  bg = "#4C566A",
  widget = grid
})

return systemMenu