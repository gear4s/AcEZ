--[[

  AcEZ - by gear4
  Wrapper for Ace3
  
  Example implementation
  
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

local name,addon = ...

local Ace = addon.Ace
  
SLASH_GH1 = "/gh"

function SlashCmdList.GH(msg, editbox)
  guildName, guildRankName, guildRankIndex = GetGuildInfo("player")
  local CoreFrame = Ace.Frame(guildName .. " - Guild Management Panel")
    :cb("OnClose", function(self, widget) self:Release(widget) end)
    :statustext(guildName .. " - Guild Management Panel")
    :layout("Fill")
    
  local tabify = Ace.AutoTabGroup("Select your poison")
                  :addtab("t1", "Test 1", function(self)
                    self:child(
                      Ace.Button("Tester Button")
                        :cb("OnEnter", function(self) self:parent():parent():statustext("Hovering tester") end)
                        :cb("OnLeave", function(self) self:parent():parent():statustext(guildName .. " - Guild Management Panel") end)
                    )
                  end)
                  :addtab("t2", "Test 2", function(self)
                    self:child(
                      Ace.Button("Tester Button 2")
                        :cb("OnEnter", function(self) self:parent():parent():statustext("Hovering tester 2") end)
                        :cb("OnLeave", function(self) self:parent():parent():statustext(guildName .. " - Guild Management Panel") end)
                    )
                  end)
  
  
  CoreFrame:child(tabify)
end
