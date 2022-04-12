-- import awful
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- import local file keymap.lua to variable keymap
local keymap = require("modules.keymap")

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = { -- All clients will match this rule.
{
  rule = {},
  properties = {
    border_width = beautiful.border_width,
    border_color = beautiful.border_normal,
    focus = awful.client.focus.filter,
    raise = true,
    keys = clientkeys,
    buttons = clientbuttons,
    screen = awful.screen.preferred,
    placement = awful.placement.centered
  }
}, -- Floating clients.
{
  rule_any = {
    instance = {"copyq", "pinentry"},
    class = {"Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv", "Tor Browser", "Wpa_gui", "veromix",
             "xtightvncviewer"},

    -- Note that the name property shown in xprop might be set slightly after creation of the client
    -- and the name shown there might not match defined rules here.
    name = {"Event Tester" -- xev.
    },
    role = {"AlarmWindow", -- Thunderbird's calendar.
    "ConfigManager", -- Thunderbird's about:config.
    "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
    }
  },
  properties = {
    floating = true
  }
}, -- set nemo to a constant width and height
{
 rule = {
  instance = "nemo"
 },
 properties = {
   width = 650,
   height = 1200,
   y = 100
 }
}, -- set vscode to a constant width and height
{
  rule = {
    name = "Visual Studio Code"
  },
  properties = {
    width = 1000,
    height = 1300,
    y = 50
  }
 }}
-- }}}

naughty.config.defaults = {
  timeout = 5,
  screen = 1,
  ontop = true,
  margin = 10,
  border_width = 0,
  position = "bottom_left",
  height = 48,
  width = 300,
  font = "Proxima Nova 8",
  fg = beautiful.fg_normal,
  bg = beautiful.bg_normal,
}
