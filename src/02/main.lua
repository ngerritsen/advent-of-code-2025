local file = require("src.utils.file")
local str = require("src.utils.string")
local arr = require("src.utils.array")

local data = file.read("input.txt")

local function is_invalid(n, all)
	local len = string.len(n)
	local max = all and len or 2

	for p = 2, max do
		if len / p % 1 == 0 then
			local s = math.floor(len / p)
			local match = true
			local first = string.sub(n, 1, s)

			for i = s + 1, len, s do
				local part = string.sub(n, i, i + s - 1)

				if part ~= first then
					match = false
					break
				end
			end

			if match then
				return true
			end
		end
	end

	return false
end

local function get_total_invalid(ranges, all)
	local total = 0

	for _, range in ipairs(ranges) do
		for n = range[1], range[2] do
			if is_invalid(n, all) then
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
