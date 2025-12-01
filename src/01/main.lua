local file = require("src.utils.file")
local str = require("src.utils.string")

local data = file.read("input.txt")
local lines = str.split(data, "\n")
local SIZE = 100

local function get_pass(per_click)
  local pos = 50
  local pass = 0

  for _, cmd in ipairs(lines) do
    local dir, n = cmd:match("([LR])(%d+)")
    local prev = pos
    local zero_passes = math.floor(math.abs(n) / SIZE)
    local mod = n % SIZE
    local next = dir == "L" and pos - mod or pos + mod

    pos = (next + SIZE) % SIZE

    if next > SIZE or next < 0 and prev ~= 0 then
      zero_passes = zero_passes + 1
    end

    if per_click then pass = pass + zero_passes end
    if pos == 0 then pass = pass + 1 end
  end

  return pass
end

local function main()
  print(get_pass(false))
  print(get_pass(true))
end

main()
