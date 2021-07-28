--[[
	J3Util
	Copyright (c) 2021 0J3#0001 (0J3_0/0J3_3). All Rights Reserved.
	
	Standard Loading Method:
	local J3Util = require(7162009730);
	
	This module contains Instance Utilities for J3Util
--]] --
local Table = setmetatable({}, { __index = table });

Table.funcToTable = function( cb )
  return setmetatable({}, { __call = function( t, ... ) return cb(...); end });
end;

Table.split = table.concat

Table.pop = function( self )
  local pos = #self;
  if pos == 0 then error('Cannot pop an empty table!', 2) end
  local item = self[pos];
  self:remove(pos);
  return item;
end;
Table.shift = function( self )
  if #self == 0 then error('Cannot shift an empty table!', 2) end
  local item = self[1];
  self:remove(1);
  return item;
end
Table.push = function( self, o )
  table.insert(self, o);
  return true;
end

Table.wrap = function( self )
  return setmetatable(self, { __index = Table; __newindex = self });
end;

return Table;
