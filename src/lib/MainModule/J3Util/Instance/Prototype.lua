--[[
	J3Util
	Copyright (c) 2021 0J3#0001 (0J3_0/0J3_3). All Rights Reserved.
	
	Standard Loading Method:
	local J3Util = require(7162009730);
	
	This module contains the default "Prototype" for Wrapped Instances (see JS Prototype for further information - accessible via J3Util.Instance.wrap.prototype)
--]] --
local prototype = {}

prototype.isWrapped = true
prototype.____isWrappedInstance = true

-- Function: Instance:forEachChild
--- Runs cb on each child
prototype.forEachChild = function( self, cb )
  for _, o in pairs(self:GetChildren()) do cb(o); end
end;
-- Function: Instance:forEachDescendant
--- Runs cb on each descendant
prototype.forEachDescendant = function( self, cb )
  for _, o in pairs(self:GetDescendants()) do cb(o); end
end;
-- Function: Instance:forEachChildOnAdded - Alias: Instance:fECOA
--- Runs cb on each child, and on new children, when they are added
prototype.forEachChildOnAdded = function( self, cb )
  self.ChildAdded:Connect(cb);
  self:forEachChild(cb);
end;
prototype.fECOA = prototype.forEachChildOnAdded;
-- Function: Instance:forEachDescendantOnAdded
--- Runs cb on each descendant, and on new descendants, when they are added - Alias: Instance:fEDOA
prototype.forEachDescendantOnAdded = function( self, cb )
  self.DescendantAdded:Connect(cb);
  self:forEachDescendant(cb);
end;
prototype.fEDOA = prototype.forEachDescendantOnAdded;

return prototype
