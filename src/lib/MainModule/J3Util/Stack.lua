--[[
	J3Util
	Copyright (c) 2021 0J3#0001 (0J3_0/0J3_3). All Rights Reserved.
	
	Standard Loading Method:
	local J3Util = require(7162009730);
	
	This module contains the J3Util Stack Module - see 'Stack (Programming)' for more information
--]] --
-- Base Class --
local StackModule = {};
StackModule.__index = StackModule;
StackModule.__tostring = 'StackModule';

-- Propreties --
StackModule.Stack = {}

-- Functions --
function StackModule:pop()
  local pos = #self;
  if pos == 0 then error('Cannot pop an empty table!', 2) end
  local item = self[pos];
  self:remove(pos);
  return item;
end
function StackModule:push( o )
  table.insert(self, o);
  return true;
end

-- Constructor --
function StackModule.new()
  local self = {};
  setmetatable(self, StackModule);
  return self;
end

-- Return --
return StackModule;
