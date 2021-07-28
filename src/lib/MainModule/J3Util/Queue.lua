--[[
	J3Util
	Copyright (c) 2021 0J3#0001 (0J3_0/0J3_3). All Rights Reserved.
	
	Standard Loading Method:
	local J3Util = require(7162009730);
	
	This module contains the J3Util Queue Module - see 'Queue (Programming)' for more information
  Totally not almost identical to Stack.lua
--]] --
-- Base Class --
local QueueModule = {};
QueueModule.__index = QueueModule;
QueueModule.__tostring = 'QueueModule';

-- Propreties --
QueueModule.Queue = {}

-- Functions --
function QueueModule:pop()
  if #self == 0 then error('Cannot pop an empty table!', 2) end
  local item = self[1];
  self:remove(1);
  return item;
end
function QueueModule:push( o )
  table.insert(self, o);
  return true;
end

-- Constructor --
function QueueModule.new()
  local self = {};
  setmetatable(self, QueueModule);
  return self;
end

-- Return --
return QueueModule;
