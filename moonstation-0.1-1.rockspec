package = "moonstation"
version = "0.1-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
dependencies = {
  "inspect",
  "split",
  "lua-curl",
  "lua-fs-module",
  "pegasus"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {
      server = "src/server.lua"
   }
}
