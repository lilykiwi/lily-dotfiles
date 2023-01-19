local awful = require("awful")
local wibox = require("wibox")

screen.connect_signal("request::wallpaper", function(s)
  awful.wallpaper {
    screen = s,
    widget = {
      {
        image  = "/home/lily/Obsidian/wallhaven-8x3xjy.jpg",
        resize = true,
        widget = wibox.widget.imagebox,
      },
      valign = "fit",
      halign = "fit",
      tiled  = false,
      widget = wibox.container.tile,
    }
  }
end)
