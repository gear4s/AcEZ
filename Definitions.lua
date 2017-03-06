--[[

  AcEZ - by gear4
  Wrapper for Ace3
  
  Base Ace3 widgets
  
  Copyright (c) 2017, Aaron Marais

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

]]

local name, addon = ...
local AceGUI = LibStub("AceGUI-3.0")
local AH = addon.AceHelper

local frameTable = AH.createTable{
  title = "SetTitle",
  layout = "SetLayout",
  statustext = "SetStatusText",
  child = function(self, child)
    child.par = self
    self.obj:AddChild(child.obj)
    return self
  end
}

local buttonTable = AH.createTable{
  text = "SetText",
  width = "SetWidth",
  disabled = "SetDisabled",
}

local checkboxTable = AH.createTable{
  val = "SetValue",
  type = "SetType",
  img = "SetImage",
  label = "SetLabel",
  desc = "SetDescription",
  tristate = "SetTriState",
  disabled = "SetDisabled",
  toggle = "ToggleChecked",
}

local dropdownTable = AH.createTable{
  val = "SetValue",
  list = "SetList",
  text = "SetText",
  item = "AddItem",
  label = "SetLabel",
  multi = "SetMultiselect",
  itemval = "SetItemValue",
  itemdisabled = "SetItemDisabled",
}

local colorpickerTable = AH.createTable{
  color = "SetColor",
  label = "SetLabel",
  alpha = "SetHasAlpha",
  disabled = "SetDisabled",
}

local editboxTable = AH.createTable{
  text = "SetText",
  label = "SetLabel",
  disabled = "SetDisabled",
  disablebutton = "DisableButton",
  maxchar = "SetMaxLetters",
  focus = "SetFocus",
  hltext = "HighlightText"
}

local headingTable = AH.createTable{
  text = "SetText",
}

AH.createType("Frame", frameTable, function(t, txt) t:SetTitle(txt) end)
AH.createType("Button", buttonTable, function(t, txt) t:SetText(txt) end)
AH.createType("CheckBox", checkboxTable, function(t, txt) t:SetLabel(txt) end)
AH.createType("Dropdown", dropdownTable, function(t, txt) t:SetLabel(txt) end)
AH.createType("ColorPicker", colorpickerTable, function(t, txt) t:SetLabel(txt) end)
AH.createType("EditBox", editboxTable, function(t, txt) t:SetLabel(txt) end)
AH.createType("Heading", editboxTable, function(t, txt) t:SetText(txt) end)

