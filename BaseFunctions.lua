--[[

  AcEZ - by gear4
  Wrapper for Ace3
  
  Core for the Ace3 wrapper
  
  Copyright (c) 2017, Aaron Marais

]]

local name, addon = ...
local AceGUI = LibStub("AceGUI-3.0")

local createTable = function(ref)
  ref.parent = function(self)
    return self.par
  end
  ref.cb = function(self, ev, cb)
    self.obj:SetCallback(ev, function(...) cb(self, ...) end)
    return self
  end
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

addon.Ace = {}
local createType = function(type,tbl,cb)
  addon.Ace[type] = function(...)
    local t = setmetatable({}, tbl)
    t.obj = AceGUI:Create(type)
    if cb then cb(t.obj, ...) end
    return t
  end
end

addon.AceHelper = {
  createType = createType,
  createTable = createTable
}
