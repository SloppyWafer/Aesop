--Arguments
local tArgs = {...}

if #tArgs ~= 2 then
  return "Two arguments needed, 'Reactor' and 'Monitor'."
end
--Startup Place Nothing Above
local reactor = peripheral.wrap(tArgs[1])
local monitor = peripheral.wrap(tArgs[2])
local w,h = monitor.getSize()
--Variables

--Functions
local function drawBorder()
  monitor.setBackgroundColor(colors.black)
  monitor.clear()
  monitor.setBackgroundColor(colors.gray)
  monitor.setCursorPos(2,2)
  for i=2,w-1 do
    for j=1,2 do
      if j == 1 then
        k = 2
      else
        k = h-1
      end
      monitor.setCursorPos(i,k)
      monitor.write(" ")
    end
  end
  for i=2,h-1 do
    for j=1,2 do
      if j == 1 then
        k = 2
      else
        k = w-1
      end
      monitor.setCursorPos(k,i)
      monitor.write(" ")
    end
  end
end

local function drawInfo()
  --Reloaded Variables
  local rft = math.ceil(reactor.getEnergyProducedLastTick())
  local rfStored = reactor.getEnergyStored()
  local fuelAmount = reactor.getFuelAmount()
  local fuelMax = reactor.getFuelAmountMax()
  local fct = reactor.getFuelConsumedLastTick()
  local fuelUsage = math.floor(fct*20)
  --
  monitor.setBackgroundColor(colors.black)
  monitor.setCursorPos(4,2)
  monitor.write(" "..tArgs[1].." ")
  monitor.setCursorPos(4,4)
  monitor.write("rf/t | "..rft)
end

--Main
while true do
  local timer1 = os.startTimer(1)
  local event, button, x, y = os.pullEvent()
  if event == "monitor_touch" then

  elseif event == "timer" then
    drawBorder()
    drawInfo()
  end
end
