--[[ replaceLine Example
os.loadAPI("naf")
naf.replaceLine("Name of file", 'line you want to edit', 'what you want to write to line')

naf.replaceLine("startup",4,"usersName = '"..input.."'")
^ - The above code changes the name of the user which is store on line 4 of the startup file
]]--
function replaceLine(path, n, content)
  local file = io.open(path, 'r')
  local fileContent = {}
  for line in file:lines() do
    table.insert(fileContent, line)
  end
  io.close(file)
  fileContent[n] = content
  file = io.open(path, 'w')
   for i,v in ipairs(fileContent) do
       file:write(v..'\n')
   end
   io.close(file)
end
