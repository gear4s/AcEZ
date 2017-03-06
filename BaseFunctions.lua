--[[

  AcEZ - by gear4
  Wrapper for Ace3
  
  Core for the Ace3 wrapper
  
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

addon.Ace = {}

local sG, cWT, cT

do
  sG = function(key, tab, rO)
    return function(self, val)
      if val ~= nil and not rO then
        self.obj[(tab and tab.set or "Set")..key](self.obj, val)
        return self
      else
        return self.obj[(tab and tab.get or "Get")..key](self.obj)
      end
    end
  end

  local widgetCore = {
    width       = "SetWidth",
    height      = "SetHeight",
    relwidth    = "SetRelativeWidth",
    fullwidth   = sG("FullWidth", {get="Is"}),
    fullheight  = sG("FullHeight", {get="Is"}),
    
    release     = "Release",
    
    point       = sG"Point",
    numpoints   = "GetNumPoints",
    clearpoints = "ClearAllPoints",
    
    shown       = sG("Shown", {get="Is"}, true),
    visible     = sG("Visible", {get="Is"}, true),
    
    udatatable  = sG("GetUserDataTable", {}, true),
    udata       = sG"UserData",
    
    cb = function(self, ev, cb)
      self.obj:SetCallback(ev, function(...) cb(self, ...) end)
      return self
    end
  }
  local bindCore = function(tbl, core)
    -- binds base API to created widgets
    for k,v in pairs(core) do
      if not tbl[k] then
        tbl[k] = v
      end
    end
  end
  cWT = function(ref)
    ref.parent = function(self)
      return self.par
    end
    bindCore(ref, widgetCore)
    return {
      obj = nil,
      par = nil,
      
      __call = function(self, cmd, ...)
        self.obj[cmd](self.obj, ...)
      end,
      
      __index = function(self, key)
        return
            -- return obj or par if requested (without metatable)
            rawget(self, key) or
            -- if "custom" function defined, return that
            type(ref[key]) == "function"  and ref[key] or
            -- if is a value/function of the Ace3 library, return that
            function(self, ...)
              local k2 = key
              local key = self.obj[ref[key]] and ref[key] or self.obj[key] and key or nil
              if key then
                self.obj[key](self.obj, ...)
              else
                error("Function undefined: "..k2)
              end
              return self
            end
      end
    }
  end

  cT = function(type,tbl,cb)
    addon.Ace[type] = function(...)
      local t = setmetatable({}, tbl)
      t.obj = AceGUI:Create(type)
      if cb then cb(t.obj, ...) end
      return t
    end
  end
end

addon.AceHelper = {
  createType = cT,
  createWidget = cWT,
  SetGet = sG
}