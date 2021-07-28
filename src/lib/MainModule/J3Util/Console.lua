-- The JS console module to make things simpler for JS Devs
local console = {}

local ts = game:GetService('TestService')

console.log = print;
console.warn = warn;
console.info = function( ... ) ts:Message(table.concat({ ... }, ' ')) end;
console.error = function( ... ) ts:Error(table.concat({ ... }, ' ')) end;

return console
