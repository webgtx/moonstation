_ENV = require("lib.lunity")()
require("luarocks.loader")

local mimetypes = require("lib.mimetypes")
local split = require("split").split
local inspect = require("inspect")
local curl = require("cURL")

function test.mimetypes()
  local parts = split("/mnt/bruh/test.txt", "/")
  print(mimetypes.guess(parts[#parts]))
end

function test.rest()
  -- HTTP Get
  curl.easy({
      url = 'localhost:9090/api',
      post = true,
      httpheader = {"Content-Type: application/json"},
      postfields = '{"hello": "world"}'
    }):perform()
end

test()
