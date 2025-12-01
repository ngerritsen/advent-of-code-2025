local file = require("src.utils.file")
local str = require("src.utils.string")

local data = file.read("input.txt")
local lines = str.split(data, "\n")

local function get_pass(per_click)
  local pos = 50
  local pass = 0

  for _, cmd in ipairs(lines) do
    local dir, num = cmd:match("([LR])(%d+)")
    local sign = dir == "L" and -1 or 1

    -- TODO: We can obviously do much better than this crap...
    for _ = 1, num do
      pos = pos + sign
      pos = (pos % 100 + 100) % 100

      if per_click and pos == 0 then
        pass = pass + 1
      end
    end

    if not per_click and pos == 0 then
      pass = pass + 1
    end
  end

  return pass
end

local function main()
  print(get_pass(false))
  print(get_pass(true))
end

main()
