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
local AH = addon.AceHelper

--[[

    WIDGETS

]]

local buttonTable = {
  text = "SetText",
  width = "SetWidth",
  disabled = "SetDisabled",
}

local checkboxTable = {
  val = "SetValue",
  type = "SetType",
  img = "SetImage",
  label = "SetLabel",
  desc = "SetDescription",
  tristate = "SetTriState",
  disabled = "SetDisabled",
  toggle = "ToggleChecked",
}

local dropdownTable = {
  val = "SetValue",
  list = "SetList",
  text = "SetText",
  item = "AddItem",
  label = "SetLabel",
  multi = "SetMultiselect",
  itemval = "SetItemValue",
  itemdisabled = "SetItemDisabled",
}

local colorpickerTable = {
  color = "SetColor",
  label = "SetLabel",
  alpha = "SetHasAlpha",
  disabled = "SetDisabled",
}

local editboxTable = {
  text = "SetText",
  label = "SetLabel",
  disabled = "SetDisabled",
  disablebutton = "DisableButton",
  maxchar = "SetMaxLetters",
  focus = "SetFocus",
  hltext = "HighlightText"
}

local headingTable = {
  text = "SetText",
}

local iconTable = {
  img = "SetImage",
  imgsize = "SetImageSize",
  label = "SetLabel",
}

local ilabelTable = {
  text = "SetText",
  color = "SetColor",
  font = "SetFont",
  fontobj = "SetFontObject",
  img = "SetImage",
  imgsize = "SetImageSize",
  hl = "SetHighlight",
  hltexcoord = "SetHighlightTexCoord",
}

local kbindTable = {
  label = "SetLabel",
  disabled = "SetDisabled",
  key = AH.SetGet"Key"
}

local labelTable = {
  text = "SetText",
  color = "SetColor",
  font = "SetFont",
  fontobj = "SetFontObj",
  img = "SetImage",
  imgsize = "SetImageSize"
}

local mleditboxTable = {
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

local sliderTable = {
  value = AH.SetGet"Value",
  values = "SetSliderValues",
  ispercent = "SetIsPercent",
  label = "SetLabel",
  disabled = "SetDisabled"
}

local sliderTable = {
  value = AH.SetGet"Value",
  values = "SetSliderValues",
  ispercent = "SetIsPercent",
  label = "SetLabel",
  disabled = "SetDisabled"
}

AH.addWidget("CheckBox",          checkboxTable,    function(t, txt) t:SetLabel(txt) end)
AH.addWidget("Dropdown",          dropdownTable,    function(t, txt) t:SetLabel(txt) end)
AH.addWidget("ColorPicker",       colorpickerTable, function(t, txt) t:SetLabel(txt) end)
AH.addWidget("EditBox",           editboxTable,     function(t, txt) t:SetLabel(txt) end)
AH.addWidget("Icon",              iconTable,        function(t, txt) t:SetLabel(txt) end)
AH.addWidget("Keybinding",        kbindTable,       function(t, txt) t:SetLabel(txt) end)
AH.addWidget("Slider",            sliderTable,      function(t, txt) t:SetValue(txt) end)
AH.addWidget("Button",            buttonTable,      function(t, txt) t:SetText (txt) end)
AH.addWidget("Heading",           headingTable,     function(t, txt) t:SetText (txt) end)
AH.addWidget("InteractiveLabel",  ilabelTable,      function(t, txt) t:SetText (txt) end)
AH.addWidget("Label",             labelTable,       function(t, txt) t:SetText (txt) end)
AH.addWidget("MultiLineEditBox",  mleditboxTable,   function(t, txt) t:SetText (txt) end)


--[[

    CONTAINERS

]]

local dropdowngroupTable = {
  title = "SetTitle",
  glist = "SetGroupList",
  group = "SetGroup",
  width = "SetDropdownWidth",
  stattable = "SetStatusTable"
}

local frameTable = {
  title = "SetTitle",
  statustext = "SetStatusText",
  stattable = "SetStatusTable",
  applystatus = "ApplyStatus"
}

local inlinegroupTable = {
  title = "SetTitle",
}

local scrollTable = {
  scroll = "SetScroll",
  stattable = "SetStatusTable"
}

local tabgroupTable = {
  title = "SetTitle",
  tabs = "SetTabs",
  seltab = "SelectTab",
  stattable = "SetStatusTable"
}

local treegroupTable = {
  tree = "SetTree",
  selpath = "SelectByPath",
  selval = "SelectByValue",
  btntooltips = "EnableButtonTooltips",
  stattable = "SetStatusTable"
}

AH.addContainer("DropdownGroup", dropdowngroupTable, function(t, txt) t:SetTitle(txt) end)
AH.addContainer("Frame", frameTable, function(t, txt) t:SetTitle(txt) end)
AH.addContainer("InlineGroup", inlinegroupTable, function(t, txt) t:SetTitle(txt) end)
AH.addContainer("ScrollFrame", scrollTable)
AH.addContainer("SimpleGroup", {})
AH.addContainer("TabGroup", tabgroupTable, function(t, txt) t:SetTitle(txt) end)
AH.addContainer("TreeGroup", treegroupTable, function(t, txt) t:SetTitle(txt) end)


--[[

    CUSTOM ITEMS

]]

-- AutoTabGroup
-- Tab group with tabbing functionality built-in
-- function addtab(TabID, TabName, TabCallback(self))
-- - adds tabs to the tab list
-- - TabID and TabName are forwarded to self.tabs{} which is passed to TabGroup:SetTabs()
-- - TabCallback(self) is the callback. self:child() to add child
AH.addCustomItem(
  true, "TabGroup", "AutoTabGroup",
  {
    title = "SetTitle",
    tabs = "SetTabs",
    seltab = "SelectTab",
    stattable = "SetStatusTable",
    addtab = function(self, gid, gname, gcb)
      self.tabs[#self.tabs+1] = {value=gid, text=gname}
      self.cbs[gid] = gcb
      self:SetTabs(self.tabs)
      return self
    end
  },
  function(t, txt)
    t.tabs = {}
    t.cbs = {}
    t:cb(
      "OnGroupSelected",
      function(self,_,_,gid)
        self:ReleaseChildren()
        if self.cbs[gid] then
          self.cbs[gid](self)
        end
      end
    )
    t:SetTitle(txt)
  end
)








