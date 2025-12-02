local Array = {}

function Array.map(arr, func)
  local next = {}

  for i, v in ipairs(arr) do
    next[i] = func(v, i)
  end

  return next
end

return Array
