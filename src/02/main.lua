local file = require("src.utils.file")
local str = require("src.utils.string")
local arr = require("src.utils.array")

local data = file.read("input.txt")

local function is_invalid(n)
	local double = n .. n
	local trimmed = string.sub(double, 2, -2)

	return string.find(trimmed, n)
end

local function is_half_invalid(n)
	local len = string.len(n)

	if len % 2 ~= 0 then
		return false
	end

	return string.sub(n, 1, len / 2) == string.sub(n, len / 2 + 1)
end

local function get_total_invalid(ranges, all)
	local total = 0

	for _, range in ipairs(ranges) do
		for n = range[1], range[2] do
			if all and is_invalid(n) or is_half_invalid(n) then
				total = total + n
			end
		end
	end

	return total
end

local function parse()
	return arr.map(str.split(data, ","), function(p)
		return arr.map(str.split(p, "-"), function(n)
			return tonumber(n)
		end)
	end)
end

local function main()
	local ranges = parse()

	print(get_total_invalid(ranges, false))
	print(get_total_invalid(ranges, true))
end

main()
