local File = {};

function File.read(filename)
  local path = arg[0]
  local dir = path:match("^(.*[/\\])") or "./"
  local file_path = dir .. filename;
  local file = io.open(file_path, "r")

  if file == nil then
    error("Could not open file: " .. path)
  end

  local data = file:read("*a");

  file:close();

  return data
end

return File
