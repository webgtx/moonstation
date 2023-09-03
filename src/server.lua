require("luarocks.loader")
local mimetypes = require("lib.mimetypes")
local pegasus = require("pegasus")
local split = require("split").split
local fs = require("fs")
local inspect = require("inspect")

local server = pegasus:new({ port=9090, timeout = 3 })
local staticDirname = "static"

server:start(function (req, res)
  -- Static Routing
  local path2file = os.getenv("PWD") .. "/" .. staticDirname .. req:path()
  local crumbs = split(path2file, "/")
  local file = fs.read(path2file)
  if req:method() == "GET" then 

    if req:path() == "/" then
      file = fs.read(staticDirname .. "/index.html")
      res:write(file)
      return 0
    end

  res
    :addHeader("Content-Type", mimetypes.guess(crumbs[#crumbs]))
    :write(file and tostring(file) or "not found")
  end

  print(inspect(req:method()) .. "\n" .. inspect(req.querystring))
end)
