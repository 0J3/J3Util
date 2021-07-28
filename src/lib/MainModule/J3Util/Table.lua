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

return Table;
