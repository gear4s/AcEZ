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

local frameTable = AH.createWidget{
  title = "SetTitle",
  layout = "SetLayout",
  statustext = "SetStatusText",
  child = function(self, child)
    child.par = self
    self.obj:AddChild(child.obj)
    return self
  end
}

local buttonTable = AH.createWidget{
  text = "SetText",
  width = "SetWidth",
  disabled = "SetDisabled",
}

local checkboxTable = AH.createWidget{
  val = "SetValue",
  type = "SetType",
  img = "SetImage",
  label = "SetLabel",
  desc = "SetDescription",
  tristate = "SetTriState",
  disabled = "SetDisabled",
  toggle = "ToggleChecked",
}

local dropdownTable = AH.createWidget{
  val = "SetValue",
  list = "SetList",
  text = "SetText",
  item = "AddItem",
  label = "SetLabel",
  multi = "SetMultiselect",
  itemval = "SetItemValue",
  itemdisabled = "SetItemDisabled",
}

local colorpickerTable = AH.createWidget{
  color = "SetColor",
  label = "SetLabel",
  alpha = "SetHasAlpha",
  disabled = "SetDisabled",
}

local editboxTable = AH.createWidget{
  text = "SetText",
  label = "SetLabel",
  disabled = "SetDisabled",
  disablebutton = "DisableButton",
  maxchar = "SetMaxLetters",
  focus = "SetFocus",
  hltext = "HighlightText"
}

local headingTable = AH.createWidget{
  text = "SetText",
}

local iconTable = AH.createWidget{
  img = "SetImage",
  imgsize = "SetImageSize",
  label = "SetLabel",
}

local ilabelTable = AH.createWidget{
  text = "SetText",
  color = "SetColor",
  font = "SetFont",
  fontobj = "SetFontObject",
  img = "SetImage",
  imgsize = "SetImageSize",
  hl = "SetHighlight",
  hltexcoord = "SetHighlightTexCoord",
}

local kbindTable = AH.createWidget{
  label = "SetLabel",
  disabled = "SetDisabled",
  key = AH.SetGet"Key"
}

local labelTable = AH.createWidget{
  text = "SetText",
  color = "SetColor",
  font = "SetFont",
  fontobj = "SetFontObj",
  img = "SetImage",
  imgsize = "SetImageSize"
}

local mleditboxTable = AH.createWidget{
  text = AH.SetGet"Text",
  label = "SetLabel",
  numlines = "SetNumLines",
  fontobj = "SetFontObj",
  disabled = "SetDisabled",
  maxchar = "SetMaxLatters",
  disablebutton = "DisableButton",
  hltext = "HighlightText",
  focus = "SetFocus"
}

local sliderTable = AH.createWidget{
  value = AH.SetGet"Value",
  values = "SetSliderValues",
  ispercent = "SetIsPercent",
  label = "SetLabel",
  disabled = "SetDisabled"
}

local sliderTable = AH.createWidget{
  value = AH.SetGet"Value",
  values = "SetSliderValues",
  ispercent = "SetIsPercent",
  label = "SetLabel",
  disabled = "SetDisabled"
}

AH.createType("Frame", frameTable, function(t, txt) t:SetTitle(txt) end)
AH.createType("Button", buttonTable, function(t, txt) t:SetText(txt) end)
AH.createType("CheckBox", checkboxTable, function(t, txt) t:SetLabel(txt) end)
AH.createType("Dropdown", dropdownTable, function(t, txt) t:SetLabel(txt) end)
AH.createType("ColorPicker", colorpickerTable, function(t, txt) t:SetLabel(txt) end)
AH.createType("EditBox", editboxTable, function(t, txt) t:SetLabel(txt) end)
AH.createType("Heading", headingTable, function(t, txt) t:SetText(txt) end)
AH.createType("Icon", iconTable, function(t, txt) t:SetLabel(txt) end)
AH.createType("InteractiveLabel", ilabelTable, function(t, txt) t:SetText(txt) end)
AH.createType("Keybinding", kbindTable, function(t, txt) t:SetLabel(txt) end)
AH.createType("Label", labelTable, function(t, txt) t:SetText(txt) end)
AH.createType("MultiLineEditBox", mleditboxTable, function(t, txt) t:SetText(txt) end)
AH.createType("Slider", sliderTable, function(t, txt) t:SetValue(txt) end)

