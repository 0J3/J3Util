--[[
	J3Util
	Copyright (c) 2021 0J3#0001 (0J3_0/0J3_3). All Rights Reserved.
	
	Standard Loading Method:
	local J3Util = require(7162009730);
	
	This module contains most of J3Util's code
--]] --
--
-- Define the version
local J3UtilVersion = '1.0.0 b1'

-- Define Submodules
local Instance = require(script.Instance);
local console = require(script.Console);
local table = require(script.Table);

-- Define Attributes Things
local J3UtilAttributes = {};
local IndexAttributes = false;
local IndexedAttributes = {};

-- Define the table for J3Util
local J3Util = setmetatable(
                 {}, {
    __index = function( t, k )
      if string.lower(k) == '_version' then return J3UtilVersion end
    end;
  }
               );

-- Function: J3Util:AttributeInfo()
--- Describes J3Util Attributes
function J3Util:AttributeInfo()
  print(
    [[-- J3Util Attribute Information --
J3Util Attributes, similar to Roblox Attributes, allow storing data using :GetAttribute(name) and :SetAttribute(name,value).

In J3Util, if J3Util:EnableAttributeIndexing() is called (ever), you can index these attributes directly (native J3Util Attributes take priority),
as such: J3Util.YourAttributeName == J3Util:GetAttribute('YourAttribute')
Additionally, if J3Util:EnableAttributeIndexing() is ever called, you can use J3Util.key=value to set an attribute.

NOTICE: J3Util Propreties take priority over custom ones!!

If this confuses you, feel free to ask 0J3#0001 on Discord
-- END --]]
  )
end

-- Function: J3Util:EnableAttributeIndexing()
--- Enables Attribute Indexing
function J3Util:EnableAttributeIndexing()
  IndexAttributes = true;
  return self;
end
-- Function: J3Util:DisableAttributeIndexing()
--- Disables Attribute Indexing
function J3Util:DisableAttributeIndexing()
  IndexAttributes = false;
  return self;
end

-- Property: J3Util.Instance
--- An improved version of Instance
J3Util.Instance = Instance;

-- Property: J3Util.Table
--- An improved version of Table
J3Util.table = table;

-- Property: J3Util.Console
--- Basic Re-Implemented Javascript Console
J3Util.console = console;

--  Return yet another metatable
return setmetatable(
         {}, {
    __index = function( t, k )
      -- Indexing Function
      if J3Util[k] then
        return J3Util[k]
      elseif rawget(J3UtilAttributes, k) then
        if IndexAttributes then
          if not IndexedAttributes[k] then
            warn(
              '[W001] Indexing proprety \'' .. tostring(k) ..
                '\' from **ATTRIBUTES** on J3Util. This message is only printed once per attribute'
            );
            IndexedAttributes[k] = true;
          end
          return J3UtilAttributes[k];
        else
          error(
            '[E002] The proprety ' .. k .. ' does not exist on J3Util at version ' ..
              rawget(t, '_version') ..
              ', however, it does exist as an attribute!\nCall J3Util:AttributeInfo() for more information on J3Util\'s Custom Attribute Functionality',
            2
          )
        end
      else
        error(
          '[E002] The proprety ' .. k .. ' does not exist on J3Util at version ' ..
            rawget(t, '_version') ..
            ' - Try seeing if a newer version of J3Util is available, or if you have a typo in your code.',
          2
        )
      end
    end;
    __newindex = function( t, k, v )
      -- New Index Function
      if IndexAttributes then
        J3UtilAttributes[k] = v;
      else
        error(
          '[E003] Attempt to set proprety ' .. k .. ' on J3Util Table (' .. tostring(t) ..
            ') to ' .. v ..
            ' which is disallowed! To extend J3Util, use a metatable which indexes it, or use Attributes.\nCall J3Util:AttributeInfo() for more information on J3Util\'s Custom Attribute Functionality.',
          2
        )
      end
    end;
  }
       );
