local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local gears = require("gears")

local high = wibox.widget{
  markup = "<span>\u{f028}  </span>",
  align = 'center',
  valign= 'center',
  widget = wibox.widget.textbox
}
local med = wibox.widget{
  markup = "<span>\u{f027}  </span>",
  align = 'center',
  valign= 'center',
  widget = wibox.widget.textbox
}
local  low = wibox.widget{
  markup = "<span>\u{f026}  </span>",
  align = 'center',
  valign= 'center',
  widget = wibox.widget.textbox
}
local  muted = wibox.widget{
  markup = "<span>\u{1f515}  </span>",
  align = 'center',
  valign= 'center',
  widget = wibox.widget.textbox
}

high.font = "Font Awesome 6 Free-Solid-900 9"
med.font = "Font Awesome 6 Free-Solid-900 9"
low.font = "Font Awesome 6 Free-Solid-900 9"
muted.font = "Font Awesome 6 Free-Solid-900 9"

local systemMenu = wibox.widget{
  {
    {
        {
          high,
          wibox.widget.textbox("val"),
          layout = wibox.layout.fixed.horizontal,
        },
        top = 2, bottom = 2, left = 8, right = 8,
        widget = wibox.container.margin
    },
    bg = '#4C566A', -- basic
    shape_border_width = 1, shape_border_color = '#4C566A', -- outline
    shape = function(cr, width, height) 
      gears.shape.rounded_rect(cr, width, height, 16)
    end,
    widget = wibox.container.background
  },
  top = 4, bottom = 4, left = 6, right = 6,
  widget = wibox.container.margin
}

--
-- ─── Callbacks ───────────────────────────────────────────────────────────────
--

-- ﱛ ﱝ ﱜ
--   

systemMenu:connect_signal("mouse::enter", function(c)
  local children = c:get_all_children()
  if children then
    children[1]:set_bg("#00000066")
  end
end)
systemMenu:connect_signal("mouse::leave", function(c)
  local children = c:get_all_children()
  if children then
    children[1]:set_bg('#4C566A')
  end
end)

systemMenu:connect_signal("button::press", function(c) 
  local children = c:get_all_children()
  if children then
    children[1]:set_bg("#000000") 
  end
end)
systemMenu:connect_signal("button::release", function(c) 
  local children = c:get_all_children()
  if children then
    children[1]:set_bg("#00000066")
  end
end)

systemMenu:connect_signal("button::press", function(c, _, _, button) 
  if button == 1 then  naughty.notify{text = 'Left click'} 
  elseif button == 2 then naughty.notify{text = 'Wheel click'} 
  elseif button == 3 then naughty.notify{text = 'Right click'} 
  elseif button == 4 then naughty.notify{text = 'mwheel up'} 
  elseif button == 5 then naughty.notify{text = 'mwheel down'} 
  end
end)

return systemMenu