local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local cyclefocus = require('modules.cyclefocus')
local variables = require("modules.variables")


-- {{{ Key bindings

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
local modkey = "Mod4"
local altkey = "Mod1"

local globalkeys = gears.table.join( --
-- ###################### Main Bindings ######################
-- show help
awful.key({modkey}, "s", hotkeys_popup.show_help, {
  description = "show help",
  group = "awesome"
}), --
-- view previous
awful.key({modkey}, "Left", awful.tag.viewprev, {
  description = "view previous",
  group = "tag"
}), --
-- view next
awful.key({modkey}, "Right", awful.tag.viewnext, {
  description = "view next",
  group = "tag"
}), --
-- go back
awful.key({modkey}, "Escape", awful.tag.history.restore, {
  description = "go back",
  group = "tag"
}), --
-- focus next by index
awful.key({modkey}, "j", function()
  awful.client.focus.byidx(1)
end, {
  description = "focus next by index",
  group = "client"
}), --
-- focus previous by index
awful.key({modkey}, "k", function()
  awful.client.focus.byidx(-1)
end, {
  description = "focus previous by index",
  group = "client"
}), --
awful.key({modkey, "Shift"}, "s", function()
  awful.spawn.with_shell("flameshot gui")
end, {
  description = "flameshot",
  group = "launcher"
}),
awful.key({modkey, "Shift"}, "c", function()
  awful.spawn.with_shell("colorpicker --short --one-shot | tr -d '#\n' | xsel -b")
end, {
  description = "colorpicker",
  group = "launcher"
}),
-- ###################### Layout manipulation ######################
-- swap with next client by index
awful.key({modkey, "Shift"}, "j", function()
  awful.client.swap.byidx(1)
end, {
  description = "swap with next client by index",
  group = "client"
}), --
-- swap with previous client by index
awful.key({modkey, "Shift"}, "k", function()
  awful.client.swap.byidx(-1)
end, {
  description = "swap with previous client by index",
  group = "client"
}), --
-- focus the next screen
awful.key({modkey, "Control"}, "j", function()
  awful.screen.focus_relative(1)
end, {
  description = "focus the next screen",
  group = "screen"
}), --
-- focus the previous screen
awful.key({modkey, "Control"}, "k", function()
  awful.screen.focus_relative(-1)
end, {
  description = "focus the previous screen",
  group = "screen"
}), --
-- jump to urgent client
awful.key({modkey}, "u", awful.client.urgent.jumpto, {
  description = "jump to urgent client",
  group = "client"
}), --
-- modkey+Shift+Tab: alt tab
awful.key({altkey}, "Tab", function(c)
  cyclefocus.cycle({
    modifier = "Alt_L"
  })
end), --
-- modkey+Shift+Tab: alt tab (reverse)
awful.key({altkey, "Shift"}, "Tab", function(c)
  cyclefocus.cycle({
    modifier = "Alt_L"
  })
end), --
-- ###################### Standard program ######################
-- open a terminal
awful.key({modkey}, "Return", function()
  awful.spawn(variables.terminal)
end, {
  description = "open a terminal",
  group = "launcher"
}), --
-- reload awesome
awful.key({modkey, "Shift"}, "r", awesome.restart, {
  description = "reload awesome",
  group = "awesome"
}), --
-- quit awesome
awful.key({modkey, "Shift"}, "p", awesome.quit, {
  description = "quit awesome",
  group = "awesome"
}), --
--increase master width factor
awful.key({modkey}, "l", function()
  awful.tag.incmwfact(0.05)
end, {
  description = "increase master width factor",
  group = "layout"
}), --
-- decrease master width factor
awful.key({modkey}, "h", function()
  awful.tag.incmwfact(-0.05)
end, {
  description = "decrease master width factor",
  group = "layout"
}), --
-- increase the number of master clients
awful.key({modkey, "Shift"}, "h", function()
  awful.tag.incnmaster(1, nil, true)
end, {
  description = "Because we knew that the moment we let people mess with the pin list, everybody would install themselves into it and it would become meaningless (and annoying).",
  group = "layout"
}), --
-- decrease the number of master clients
awful.key({modkey, "Shift"}, "l", function()
  awful.tag.incnmaster(-1, nil, true)
end, {
  description = "decrease the number of master clients",
  group = "layout"
}), --
-- Increase column count in layout
awful.key({modkey, "Control"}, "h", function()
  awful.tag.incncol(1, nil, true)
end, {
  description = "increase the number of columns",
  group = "layout"
}), --
-- Decrease column count in layout
awful.key({modkey, "Control"}, "l", function()
  awful.tag.incncol(-1, nil, true)
end, {
  description = "decrease the number of columns",
  group = "layout"
}), --
-- Select Next Layout
-- awful.key({modkey}, "space", function()
--  awful.layout.inc(1)
-- end, {
--  description = "select next",
--  group = "layout"
-- }),
-- Select Previous Layout
-- awful.key({modkey, "Shift"}, "space", function()
--  awful.layout.inc(-1)
-- end, {
--  description = "select previous",
--  group = "layout"
-- }),
-- restore minimized
awful.key({modkey, "Control"}, "n", function()
  local c = awful.client.restore()
  -- Focus restored client
  if c then
    c:emit_signal("request::activate", "key.unminimize", {
      raise = true
    })
  end
end, {
  description = "restore minimized",
  group = "client"
}), --
-- ###################### Prompt ######################
-- run prompt
--awful.key({modkey}, "r", function()
--  awful.screen.focused().mypromptbox:run()
--end, {
--  description = "run prompt",r
--  group = "launcher"
--}), --
-- launcher
awful.key({modkey}, "space", function()
  awful.spawn(variables.rofi)
end, {
  description = "launch rofi",
  group = "launcher"
}), --
-- lua execute prompt
awful.key({modkey}, "x", function()
  awful.prompt.run {
    prompt = "Run Lua code: ",
    textbox = awful.screen.focused().mypromptbox.widget,
    exe_callback = awful.util.eval,
    history_path = awful.util.get_cache_dir() .. "/history_eval"
  }
end, {
  description = "lua execute prompt",
  group = "awesome"
}))

clientkeys = gears.table.join(awful.key({modkey}, "f", function(c)
  c.fullscreen = not c.fullscreen
  c:raise()
end, {
  description = "toggle fullscreen",
  group = "client"
}), --
-- close
awful.key({modkey}, "q", function(c)
  c:kill()
end, {
  description = "close",
  group = "client"
}), --
-- toggle floating
awful.key({modkey, "Control"}, "space", awful.client.floating.toggle, {
  description = "toggle floating",
  group = "client"
}), --
-- move to master
awful.key({modkey, "Control"}, "Return", function(c)
  c:swap(awful.client.getmaster())
end, {
  description = "move to master",
  group = "client"
}), --
-- move to screen
awful.key({modkey}, "o", function(c)
  c:move_to_screen()
end, {
  description = "move to screen",
  group = "client"
}), --
-- toggle keep on top
awful.key({modkey}, "t", function(c)
  c.ontop = not c.ontop
end, {
  description = "toggle keep on top",
  group = "client"
}), --
-- minimize
awful.key({modkey}, "n", function(c)
  -- The client currently has the input focus, so it cannot be
  -- minimized, since minimized clients can't have the focus.
  c.minimized = true
end, {
  description = "minimize",
  group = "client"
}), --
-- (un)maximize
awful.key({modkey}, "m", function(c)
  c.maximized = not c.maximized
  c:raise()
end, {
  description = "(un)maximize",
  group = "client"
}), --
-- (un)maximize vertically
awful.key({modkey, "Control"}, "m", function(c)
  c.maximized_vertical = not c.maximized_vertical
  c:raise()
end, {
  description = "(un)maximize vertically",
  group = "client"
}), --
-- (un)maximize horizontally
awful.key({modkey, "Shift"}, "m", function(c)
  c.maximized_horizontal = not c.maximized_horizontal
  c:raise()
end, {
  description = "(un)maximize horizontally",
  group = "client"
}))

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys, --
  -- View tag only.
  awful.key({modkey}, "#" .. i + 9, function()
    local screen = awful.screen.focused()
    local tag = screen.tags[i]
    if tag then
      tag:view_only()
    end
  end, {
    description = "view tag #" .. i,
    group = "tag"
  }), --
  -- Toggle tag display.
  -- awful.key({modkey, "Control"}, "#" .. i + 9, function()
  --  local screen = awful.screen.focused()
  --  local tag = screen.tags[i]
  --  if tag then
  --    awful.tag.viewtoggle(tag)
  --  end
  -- end, {
  --  description = "toggle tag #" .. i,
  --  group = "tag"
  -- }), --
  -- Move client to tag.
  awful.key({modkey, "Shift"}, "#" .. i + 9, function()
    if client.focus then
      local tag = client.focus.screen.tags[i]
      if tag then
        client.focus:move_to_tag(tag)
      end
    end
  end, {
    description = "move focused client to tag #" .. i,
    group = "tag"
  }), --
  -- Toggle tag on focused client.
  awful.key({modkey, "Control", "Shift"}, "#" .. i + 9, function()
    if client.focus then
      local tag = client.focus.screen.tags[i]
      if tag then
        client.focus:toggle_tag(tag)
      end
    end
  end, {
    description = "toggle focused client on tag #" .. i,
    group = "tag"
  }))
end

clientbuttons = gears.table.join(awful.button({}, 1, function(c)
  c:emit_signal("request::activate", "mouse_click", {
    raise = true
  })
end), awful.button({modkey}, 1, function(c)
  c:emit_signal("request::activate", "mouse_click", {
    raise = true
  })
  awful.mouse.client.move(c, 16)
end), awful.button({modkey}, 3, function(c)
  c:emit_signal("request::activate", {
    raise = true
  })
  awful.mouse.client.resize(c)
end))


-- Set keys
root.keys(globalkeys)
-- }}}
