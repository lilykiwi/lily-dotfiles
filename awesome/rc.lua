-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local menubar = require("menubar")

--local gamelauncher = require("gamelauncher")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local config_path = gfs.get_configuration_dir()

local volume_widget = require('awesome-wm-widgets.volume-widget.volume')

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
-- naughty.connect_signal("request::display_error", function(message, startup)
--    naughty.notification {
--        urgency = "critical",
--        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
--        message = message
--    }
-- end)
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(config_path .. "theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = code
editor_cmd = terminal .. " -e nano"
screenshot = "escrotum -s -C"
-- todo: sync rofi theme
rofi = "rofi -show drun"
rofiWindow = 'rofi -show window -kb-cancel "Super+Escape,Escape" -kb-accept-entry "!Alt-Tab,!Super+Super_L,Return" -kb-row-down "Alt+Tab,Alt+Right" -kb-row-up "Alt+ISO_Left_Tab,Alt+Shift+Tab,Alt+Left" " .. config_path .. "config/appLaunch.rasi'
-- end todo
picom = "picom --config " .. config_path .. "config/picom.conf"
conky = "conky -c " .. config_path .. "config/conkyrc"
ulancher = "env GDK_BACKEND=x11 /usr/bin/ulauncher --hide-window"

modkey = "Mod4"
altkey = "Mod1"
-- }}}

-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
  awful.layout.append_default_layouts({awful.layout.suit.floating, awful.layout.suit.tile, awful.layout.suit.tile.left,
                                       awful.layout.suit.tile.bottom, awful.layout.suit.tile.top, awful.layout.suit.max})
end)
-- }}}

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
  awful.wallpaper {
    screen = s,
    widget = {
      {
        image = beautiful.wallpaper,
        upscale = true,
        downscale = true,
        widget = wibox.widget.imagebox
      },
      valign = "center",
      halign = "center",
      tiled = false,
      widget = wibox.container.tile
    }
  }
end)
-- }}}

-- {{{ Wibar

screen.connect_signal("request::desktop_decoration", function(s)
  -- Each screen has its own tag table.
  awful.tag({"main"}, s, awful.layout.layouts[1])

  s.taglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
  }

  -- Create a textclock widget
  s.textclock = wibox.widget.textclock('%A %H:%M')

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox {
    screen = s,
    spacing = 10,
    buttons = {awful.button({}, 1, function()
      awful.layout.inc(1)
    end), awful.button({}, 3, function()
      awful.layout.inc(-1)
    end), awful.button({}, 4, function()
      awful.layout.inc(-1)
    end), awful.button({}, 5, function()
      awful.layout.inc(1)
    end)}
  }

  -- Create the wibox
  s.mywibox = awful.wibar {
    position = "top",
    height = 20,
    bg = "#1a1b1e",
    screen = s,
    widget = {
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        spacing = 10,
        s.mypromptbox
      },
      { -- Middle widget
        layout = wibox.layout.fixed.horizontal,
        spacing = 10,
      },
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        spacing = 10,

        wibox.widget.systray(),
        s.textclock,
        require("widgets.bluetooth"),
        volume_widget{
          widget_type = 'icon_and_text'
        },
        s.mylayoutbox,
      },
      layout = wibox.layout.align.horizontal,
    }
  }
end)
-- }}}

-- {{{ Key bindings

-- General Awesome keys
awful.keyboard.append_global_keybindings({awful.key({modkey, "Shift"}, "r", awesome.restart, {
  description = "reload awesome",
  group = "awesome"
}), awful.key({modkey, "Shift"}, "q", awesome.quit, {
  description = "quit awesome",
  group = "awesome"
}), awful.key({modkey}, "Return", function()
  awful.spawn(terminal)
end, {
  description = "open a terminal",
  group = "launcher"
}), awful.key({modkey}, "r", function()
  awful.screen.focused().mypromptbox:run()
end, {
  description = "run prompt",
  group = "launcher"
}), awful.key({modkey}, "space", function()
  awful.spawn(rofi)
end, {
  description = "show the menubar",
  group = "launcher"
}), awful.key({altkey}, "Tab", function()
  awful.spawn(rofiWindow)
end, {
  description = "focus next by index",
  group = "client"
}), awful.key({altkey, "Shift"}, "Tab", function()
  awful.client.focus.byidx(-1)
end, {
  description = "focus previous by index",
  group = "client"
})})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({awful.key({}, "XF86MonBrightnessUp", function()
  awful.spawn("xbacklight -inc 5", false)
  if toggleBriOSD ~= nil then
    toggleBriOSD(true)
  end
  if UpdateBrOSD ~= nil then
    UpdateBriOSD()
  end
end, {
  description = "+5%",
  group = "hotkeys"
}), --
-- Brightness Down
awful.key({}, "XF86MonBrightnessDown", function()
  awful.spawn("xbacklight -dec 5", false)
  if toggleBriOSD ~= nil then
    toggleBriOSD(true)
  end
  if UpdateBrOSD ~= nil then
    UpdateBriOSD()
  end
end, {
  description = "-5%",
  group = "hotkeys"
}), --
-- Volume Up
awful.key({}, "XF86AudioRaiseVolume", function()
  awful.spawn("amixer -D pulse sset Master 5%+", false)
  awesome.emit_signal("volume_change")
end, {
  description = "volume up",
  group = "hotkeys"
}), --
-- Volume Down
awful.key({}, "XF86AudioLowerVolume", function()
  awful.spawn("amixer -D pulse sset Master 5%-", false)
  awesome.emit_signal("volume_change")
end, {
  description = "volume down",
  group = "hotkeys"
}), --
-- Toggle Mute
awful.key({}, "XF86AudioMute", function()
  awful.spawn("amixer -D pulse set Master 1+ toggle", false)
  awesome.emit_signal("volume_change")
end, {
  description = "toggle mute",
  group = "hotkeys"
}), --
-- Next Music
awful.key({}, "XF86AudioNext", function()
  awful.spawn("mpc next", false)
end, {
  description = "next music",
  group = "hotkeys"
}), --
-- Previous Music
awful.key({}, "XF86AudioPrev", function()
  awful.spawn("mpc prev", false)
end, {
  description = "previous music",
  group = "hotkeys"
}), --
-- Play/Pause Music
awful.key({}, "XF86AudioPlay", function()
  awful.spawn("mpc toggle", false)
end, {
  description = "play/pause music",
  group = "hotkeys"
}), --
-- TODO: edit this Screenshot on prtscn using scrot
awful.key({modkey, "Shift"}, "s", function()
  awful.util.spawn(screenshot, false)
end)})

client.connect_signal("request::default_mousebindings", function()
  awful.mouse.append_client_mousebindings({awful.button({}, 1, function(c)
    c:activate{
      context = "mouse_click"
    }
  end), awful.button({modkey}, 1, function(c)
    c:activate{
      context = "mouse_click",
      action = "mouse_move"
    }
  end), awful.button({modkey}, 3, function(c)
    c:activate{
      context = "mouse_click",
      action = "mouse_resize"
    }
  end)})
end)

client.connect_signal("request::default_keybindings", function()
  awful.keyboard.append_client_keybindings({ -- toggle fullscreen
  awful.key({modkey}, "F11", function(c)
    c.fullscreen = not c.fullscreen
  end, {
    description = "toggle fullscreen",
    group = "client"
  }), --
  -- close client
  awful.key({modkey}, "q", function(c)
    c:kill()
  end, {
    description = "close",
    group = "client"
  }), --
  -- Minimize
  awful.key({modkey}, "n", function(c)
    -- The client currently has the input focus, so it cannot be
    -- minimized, since minimized clients can't have the focus.
    c.minimized = true
  end, {
    description = "minimize",
    group = "client"
  }), --
  -- Maximize
  awful.key({modkey}, "m", function(c)
    c.maximized = not c.maximized
    c:raise()
  end, {
    description = "(un)maximize",
    group = "client"
  })})
end)

-- }}}

-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
  -- All clients will match this rule.
  ruled.client.append_rule {
    id = "global",
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      placement = awful.placement.centered
    }
  }
end)

-- }}}

-- {{{ Notifications

ruled.notification.connect_signal('request::rules', function()
  -- All notifications will match this rule.
  ruled.notification.append_rule {
    rule = {},
    properties = {
      screen = awful.screen.preferred,
      implicit_timeout = 5
    }
  }
end)

naughty.connect_signal("request::display", function(n)
  naughty.layout.box {
    notification = n
  }
end)

-- }}}

--- {{{ Autostart

awful.spawn(picom);
awful.spawn(conky);
awful.spawn(ulauncher);

--- }}}
