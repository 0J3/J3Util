--[[
	J3Util
	Copyright (c) 2021 0J3#0001 (0J3_0/0J3_3). All Rights Reserved.
	
	Standard Loading Method:
	local J3Util = require(7162009730);
	
	Clear the cache using:
	if game:GetService('ReplicatedStorage'):FindFirstChild('ModuleCache') and game:GetService('ReplicatedStorage').ModuleCache:FindFirstChild('J3Util') then game:GetService('ReplicatedStorage').ModuleCache.J3Util:Destroy();end
	(intended for clearing the cache **in studio**)
	
	This module returns it's J3Util Child after copying it to ReplicatedStorage
]] --
--- STEP: Check for a cached version
-- Ensure a cache exists
if not game:GetService('ReplicatedStorage'):FindFirstChild('ModuleCache') then
  local v = Instance.new('Folder');
  v.Name = 'ModuleCache';
  v.Parent = game:GetService('ReplicatedStorage');
  -- Check the Cache
elseif game:GetService('ReplicatedStorage'):FindFirstChild('ModuleCache'):FindFirstChild(
  'J3Util'
) then
  return game:GetService('ReplicatedStorage'):FindFirstChild('ModuleCache')
           :FindFirstChild(
             'J3Util'
           )
end

--- STEP: Init
-- Clone J3Util
local Clone = script.J3Util:Clone()

--- STEP: Preload J3Util
-- Load J3Util
local J3Util = require(Clone)
-- Get it's Version
local J3UtilVer = J3Util._version

--- STEP: Print J3Util Version
print('Loading J3Util@' .. J3UtilVer)

--- STEP: Move to Cache
-- Move the clone to a cached location
Clone.Parent = game:GetService('ReplicatedStorage'):FindFirstChild('ModuleCache');

--- STEP: Finalize
-- Ensure the clone is named J3Util
Clone.Name = 'J3Util'
-- Set the Version Attribute
Clone:SetAttribute('Version', J3UtilVer)
-- Return the clone
return Clone
