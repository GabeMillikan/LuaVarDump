# LuaVarDump
Print tables, but they're nicely formatted


# Usage
myTable = {
  "Hello",
  x = 5,
  nil,
  y = {
    woah = "a nested table??"
  }
}
myTable.y.recursive = myTable
Util:print(myTable)
