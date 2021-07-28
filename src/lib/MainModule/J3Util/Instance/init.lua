--[[
	J3Util
	Copyright (c) 2021 0J3#0001 (0J3_0/0J3_3). All Rights Reserved.
	
	Standard Loading Method:
	local J3Util = require(7162009730);
	
	This module contains Instance Utilities for J3Util
--]] --
local instance = setmetatable({}, { __index = Instance });

local String = typeof('Something');
local Inst = typeof(game);
local Table = typeof{};

local TableUtil = require(script.Parent.Table);

-- Function: Instance.wrap
--- Wraps an Instance using a metatable to have more propreties
instance.wrap = TableUtil.funcToTable(
                  function( inst )
    local IndexedAttributes = {};
    local IndexedNilAttributes = {};
    local function hasProperty( prop )
      local success = pcall(function() local t = inst[prop] end);
      return success;
    end
    local indexFunction = function( t, k ) -- Indexing
      local ret;
      if k == 'raw' then
        return inst;
      elseif inst:GetAttribute(k) then
        if not IndexedAttributes[k] then
          warn(
            '[W003] Indexing proprety \'' .. tostring(k) ..
              '\' from **ATTRIBUTES** on Instance' .. inst.Name ..
              '. This message is only printed once per attribute.\nTo get the raw attribute, use inst.raw.' ..
              tostring(k) .. ' instead.'
          );
          IndexedAttributes[k] = true;
        end
        ret = inst:GetAttribute(k);
      elseif instance.wrap.prototype[k] then
        return instance.wrap.prototype[k];
      elseif hasProperty(k) then
        ret = inst[k];
      end
      if not ret then
        if not IndexedNilAttributes[k] then
          warn(
            '[W003] Attempt to index proprety \'' .. tostring(k) .. '\' on Instance' ..
              inst.Name .. ', despite it not existing. Returning nil!'
          );
          IndexedNilAttributes[k] = true;
        end
        return nil;
      else
        if typeof(ret) == Inst then
          return instance.wrap(ret)
        else
          return ret;
        end
      end
    end;
    local newindexFunction = function( t, k, v ) -- Creating a new Index
      if hasProperty(k) then
        inst[k] = v;
      else
        inst:SetAttribute(k, v);
      end
    end;

    local wrapped = setmetatable(
                      {}, {
        __index = indexFunction;
        __newindex = newindexFunction;
        __tostring = function() return inst.Name; end;
      }
                    );
    return wrapped
  end
                );
instance.wrap.prototype = require(script.Prototype)

-- Function: Instance.new
--- Creates a new Instance with some additional functions, such as a table for propreties, and a non-deprecated parent argument - Is limited to 2 functions
instance.new = function( a, b )
  local aType = typeof(a);
  local bType = typeof(b);
  local aIsString = aType == String;
  local aIsTable = aType == Table;
  local bIsTable = bType == Table and not b.____isWrappedInstance;
  local bIsInstance = (bType == Inst) or (bType == Table and b.____isWrappedInstance);

  local inst;

  -- if a is a table and b exists, error
  if aIsTable and b then
    error(
      '[E001] Cannot call J3Util.Instance.new() with a as a table, and b as not nil.', 2
    );
  end

  if aIsString and bIsInstance then -- If a is a String, and b is an Instance, use standard Instance.new
    inst = Instance.new(a);
    if bType == Table and b.____isWrappedInstance then
      inst.Parent = b.raw;
    else
      inst.Parent = b;
    end
  elseif aIsString and bIsTable then -- if a is a String, and b is a Table, set propreties of the instance
    inst = Instance.new(a);
    for k, v in pairs(b) do
      if not (pcall(function() inst[k] = v; end)) then inst:SetAttribute(k, v); end
    end
  elseif aIsTable then -- if a is a table, b is nil
    local ClassProp = a.Class or a.ClassName or a.Type or a.ClassType
    if not ClassProp then
      warn(
        '[W002] No Class Proprety (a.[Class|ClassName|Type|ClassType]) was found. Defaulting to \'Folder\''
      )
    end
    inst = Instance.new(ClassProp or 'Folder')
    for k, v in pairs(a) do
      if (v.____isWrappedInstance) then v = v.raw end
      if k ~= 'ClassName' and k ~= 'Class' and k ~= 'Type' and k ~= 'ClassType' then
        if not (pcall(function() inst[k] = v; end)) then inst:SetAttribute(k, v); end
      end
    end
  elseif aIsString and not b then -- if a is string and b is nil, use standard Instance.new
    inst = Instance.new(a);
  else
    local invalidType = 'b';
    local invalidTypeMustBe = 'Table or Instance';

    if not aIsTable and not aIsString then
      invalidType = 'a';
      invalidTypeMustBe = 'Table or String';
    end

    return error(
             '[E004] Type of ' .. invalidType .. ' is invalid, it must be ' ..
               invalidTypeMustBe, 2
           );
  end

  inst = instance.wrap(inst);

  return inst;
end;

return instance;
