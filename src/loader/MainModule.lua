-- Standard J3Util Loader
-- Unminified
-- Copyright (c) 2021 0J3#0001. All Rights Reserved.
--
-- Loads https://www.roblox.com/library/7161939003/
--
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
--
-- Define the J3Util ID
local J3UtilID = 7161939003;

-- Check for SSS>J3Util
local J3Util = game:GetService('ServerScriptService'):FindFirstChild('J3Util');
-- If it exists
if J3Util then
  print('INFO: Using Development Build of J3Util')
  -- Load it's mainmodule child
  J3Util = require(J3Util:FindFirstChild('MainModule'));
  -- Otherwise
else
  -- Load it from it's ID
  J3Util = require(J3UtilID);
end

-- Return it's required form
return require(J3Util);
