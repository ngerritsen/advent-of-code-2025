local String = {}

function String.split(str, sep)
  local parts = {}

  for part in str:gmatch("[^" .. sep .. "]+") do
    table.insert(parts, part)
  end

  return parts
end

return String
