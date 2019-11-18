--Variables
attachedPeripherals = peripheral.getNames()
reactor = ""
monitor = ""
local w,h = term.getSize()
--Functions
local function drawEnv()
  term.setBackgroundColor(colors.gray)
  term.clear()
  term.setCursorPos(w/2-12,4)
  term.write("                       "..string.char(17))
  term.setCursorPos(w/2-2,h)
  term.write("Next")
  term.setBackgroundColor(colors.green)
end

local function stageOne()
  term.setCursorPos(w/2-5,4)
  term.setTextColor(colors.lightGray)
  write("Peripherals")
  term.setTextColor(colors.white)

end

--Main
drawEnv()
stageOne()
