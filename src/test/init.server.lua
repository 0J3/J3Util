pcall(function() game:GetService('ReplicatedStorage').ModuleCache:Destroy(); end) -- ensure it isnt cached
local TestEz = require(script.TestEZ)

TestEz.TestBootstrap:run({ script['Instance.spec']; script['Table.spec'] })
