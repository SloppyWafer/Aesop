--Variables
attachedPeripherals = peripheral.getNames()
attachedReactors = {}
attachedMonitors = {}
local w,h = term.getSize()
screenState = 0
local choosenReactor = ""
local choosenMonitor = ""

--Functions
local function addReactor()
  for i=0,1000 do
    if peripheral.isPresent("BigReactors-Reactor_"..tostring(i)) then
      attachedReactors[i] = "BigReactors-Reactor_"..tostring(i)
    end
  end
end

local function addMonitor()
  for i=0,1000 do
    if peripheral.isPresent("monitor_"..tostring(i)) then
      attachedMonitors[i] = "monitor_"..tostring(i)
    end
  end
end

local function drawEnv()
  --Drop down Menu
  term.setBackgroundColor(colors.gray)
  term.clear()
  term.setCursorPos(w/2-12,4)
  term.setBackgroundColor(colors.lightGray)
  term.write("                       "..string.char(17))
  term.setCursorPos(w/2-5,4)
  term.setBackgroundColor(colors.lightGray)
  write("Peripherals")
  --Next button
  term.setBackgroundColor(colors.green)
  term.setCursorPos(w/2-4,h-3)
  term.write("        ")
  term.setCursorPos(w/2-4,h-2)
  term.write("  Next  ")
  term.setCursorPos(w/2-4,h-1)
  term.write("        ")
  term.setBackgroundColor(colors.gray)
end

function dropDownReactorList()
  addReactor()
  term.setCursorPos(w/2-12,4)
  term.setBackgroundColor(colors.lightGray)
  term.write("                       "..string.char(31))
  --Draw List background
  for i=0,#attachedReactors do
    term.setCursorPos(w/2-12,4+i+1)
    term.setBackgroundColor(colors.lightGray)
    term.write("                        ")
  end
  --draw reactor table to screen
  for i=0,#attachedReactors do
    wTemp = #attachedReactors[i]/2+1
    term.setCursorPos(w/2-wTemp,4+i+1)
    write(attachedReactors[i])
  end
  term.setBackgroundColor(colors.gray)
end

function dropDownMonitorList()
  addMonitor()
  term.setCursorPos(w/2-12,4)
  term.setBackgroundColor(colors.lightGray)
  term.write("                       "..string.char(31))
  --Draw List background
  for i=0,#attachedMonitors do
    term.setCursorPos(w/2-12,4+i+1)
    term.setBackgroundColor(colors.lightGray)
    term.write("                        ")
    wTemp = #attachedMonitors[i]/2+1
    term.setCursorPos(w/2-wTemp,4+i+1)
    write(attachedMonitors[i])
  end
  term.setBackgroundColor(colors.gray)
end

function projectionScreen()
  term.setBackgroundColor(colors.gray)
  term.clear()
  term.setCursorPos(1,1)
  term.setTextColor(colors.green)
  term.setBackgroundColor(colors.gray)
  term.setCursorPos((w/2)-(#choosenReactor/2)-1,4)
  write(choosenReactor)
  term.setCursorPos(w/2,5)
  write(string.char(25))
  term.setCursorPos((w/2)-(#choosenMonitor/2)-1,6)
  write(choosenMonitor)
  term.setTextColor(colors.white)
  term.setBackgroundColor(colors.green)
  term.setCursorPos(w/2-5,h-3)
  term.write("           ")
  term.setCursorPos(w/2-5,h-2)
  term.write("  Project  ")
  term.setCursorPos(w/2-5,h-1)
  term.write("           ")
  term.setBackgroundColor(colors.gray)
end

--Main
drawEnv()
while true do
  event, button, x ,y = os.pullEvent()
  if event == "mouse_click" then
    if screenState == 0 then --Reactor Selection Panel
      if x >= (w/2-12) and x <= (w/2+11) and y == 4 then
        dropDownReactorList()
        screenState = 1
      elseif x >= (w/2-4) and x <= (w/2+4) and y >= (h-3) and y <= (h-1) then
        if choosenReactor ~= "" then
          drawEnv()
          term.setTextColor(colors.green)
          term.setBackgroundColor(colors.gray)
          term.setCursorPos((w/2)-(#choosenReactor/2)-1,2)
          write(choosenReactor)
          term.setCursorPos(w/2,3)
          write(string.char(25))
          term.setTextColor(colors.white)
          screenState = 2
        end
      end
    elseif screenState == 1 then -- Reactor List selection options
      for i=0,#attachedReactors do
        if x >= (w/2-12) and x <= (w/2+11) and y == 4+i+1 then
          rTemp = #attachedReactors[i]/2
          drawEnv()
          term.setCursorPos(w/2-rTemp-1,4)
          term.setBackgroundColor(colors.lightGray)
          write(attachedReactors[i])
          choosenReactor = attachedReactors[i]
          screenState = 0
        end
      end
    elseif screenState == 2 then --Monitor selection panel
      if x >= (w/2-12) and x <= (w/2+11) and y == 4 then
        dropDownMonitorList()
        screenState = 3
      elseif x >= (w/2-4) and x <= (w/2+4) and y >= (h-3) and y <= (h-1) then
        if choosenMonitor ~= "" then
          projectionScreen()
          screenState = 4
        end
      end
    elseif screenState == 3 then --Monitor list selection options
      for i=0,#attachedMonitors do
        if x >= (w/2-12) and x <= (w/2+11) and y == 4+i+1 then
            rTemp = #attachedMonitors[i]/2
            drawEnv()
            --Choosen reactor on next screen
            term.setTextColor(colors.green)
            term.setBackgroundColor(colors.gray)
            term.setCursorPos((w/2)-(#choosenReactor/2)-1,2)
            write(choosenReactor)
            term.setCursorPos(w/2,3)
            write(string.char(25))
            term.setTextColor(colors.white)
            term.setCursorPos(w/2-12,4)
            term.setBackgroundColor(colors.lightGray)
            term.write("                       "..string.char(17))
            --
            term.setCursorPos(w/2-rTemp-1,4)
            term.setBackgroundColor(colors.lightGray)
            write(attachedMonitors[i])
            choosenMonitor = attachedMonitors[i]
            screenState = 2
        end
      end
    elseif screenState == 4 then -- Project Option
      if x >= (w/2-4) and x <= (w/2+4) and y >= (h-3) and y <= (h-1) then
        drawEnv()
        shell.openTab('programs/reactorController.lua'.." "..choosenReactor.." "..choosenMonitor)
        screenState = 0
      end
    end
  end
end
