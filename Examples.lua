--[[

  AcEZ - by gear4
  Wrapper for Ace3
  
  Example implementation
  
  Copyright (c) 2017, Aaron Marais

]]

local name,addon = ...

local Ace = addon.Ace

Ace.Frame("AceGUI-3.0 Example")
  :cb("OnClose", function(self, widget) self:Release(widget) end)
  :statustext("Status Bar")
  :layout("Flow")
  :child(
    Ace.Button("Tester")
      :width(174)
      :cb("OnClick", function() print("Click!") end)
      :cb("OnEnter", function(self) self:parent():statustext("Hovering on Tester") end)
      :cb("OnLeave", function(self) self:parent():statustext("Status Bar") end)
  )
  :child(
    Ace.CheckBox("Yolo")
      :cb("OnValueChanged", function(self, val) print(val.checked) end)
  )
  :child(
    Ace.Dropdown("Solo")
      :list({
        "text"
      })
      :item(2, "tester")
  )
  :child(
    Ace.ColorPicker("Rolo")
      :color(192,168,0,0)
      :alpha(false)
  )
