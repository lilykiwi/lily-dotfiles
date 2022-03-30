local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

-- {{{ Wibar
-- Create a textclock widget
local yyyymmdd = wibox.widget.textclock()
yyyymmdd.format = "%y-%m-%d"
local date = wibox.widget.textclock()
date.format = "%B"
local time = wibox.widget.textclock()
time.format = "%H:%M"
local textclock = wibox.widget({
	wibox.container.place(yyyymmdd),
	wibox.container.place(date),
	wibox.container.place(time),
	layout = wibox.layout.fixed.vertical,
})

local systemTray = wibox.widget.systray()
systemTray.set_horizontal(false)
systemTray.set_base_size(24)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
local net_widgets = require("net_widgets")
local net_wireless = net_widgets.wireless({ interface = "enp5s0" })

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
  -- TODO: move this to rc or something
	awful.tag({ "dev","" }, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
		layout = wibox.layout.fixed.vertical,
	})

	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "left",
		screen = s,
		width = 48,
	})

	s.nothing = wibox.widget({
		markup = " ",
		widget = wibox.widget.textbox,
	})

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.vertical,
		{ -- Left widgets
			fill_space = false,
			spacing = 8,
			layout = wibox.layout.fixed.vertical,
			-- buttons
			Launcher,
			s.mytaglist,
			s.mypromptbox,
		},
		s.nothing, -- Middle widgets
		{ -- Right widgets
			fill_space = false,
			spacing = 8,
			layout = wibox.layout.fixed.vertical,
			-- buttons
			battery_widget({
				path_to_icons = "/usr/share/icons/Papirus-Dark/",
			}),
      wibox.container.margin(
				net_widgets.indicator({
					interfaces = { "enp5s0", "enp42s0" },
					timeout = 5,
					popup_position = "bottom_left",
				}),
				12,12,12,12
			),
			wibox.container.place(volume_widget({
				widget_type = "icon_and_text",
			})),
			-- wibox.container.place(systemTray),
			textclock,
			wibox.container.margin(s.mylayoutbox, 8, 8, 0, 8),
		},
	})
end)
-- }}}
