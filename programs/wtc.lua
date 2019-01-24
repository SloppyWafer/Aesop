helpCheck = true
w,h = term.getSize()
bgCol = colors.black

function cText(myStr,ch)--centers text with custom Height
	local w,h = term.getSize()
	myStrLen = myStr.len(myStr)
	term.setCursorPos(w/2-(myStrLen/2),ch)
	write(myStr)
end

function drawWTC()
    term.setBackgroundColor(bgCol)
    term.clear()
    local w,h = term.getSize()
	term.setBackgroundColor(colors.gray)
    term.setTextColor(colors.white)
	cLib.cText("             ",2)
	cLib.cText("WTC",2)
	cLib.cText(tostring(os.getComputerID()),3)
	cLib.cText("             ",3)
	cLib.cText("             ",4)
	cLib.cText("             ",5)
	cLib.cText("             ",6)
	cLib.cText("             ",7)
	cLib.cText("             ",8)
	cLib.cText("             ",9)
	cLib.cText("             ",10)
	cLib.cText(" H-Help      ",11)
    cLib.cText(" TAB-Close   ",12)
	---------------------------
	term.setCursorPos(31,3)
	term.setBackgroundColor(colors.lightGray)
	cLib.cText("  Q  W Bsp ",3)
	cLib.cText("           ",4)
	cLib.cText("  A  S  D  ",5)
	cLib.cText("           ",6)
	cLib.cText(" 1-9 ^ Ent ",7)
	cLib.cText("           ",8)
	cLib.cText("  <  v  >  ",9)
	cLib.cText("   SPACE   ",10)
  term.setBackgroundColor(colors.gray)
  term.setTextColor(colors.red)
  tempx = w/2+6
  cLib.printxy(string.char(7),tonumber(tempx),2)
end
function drawHelp()
	if helpCheck == true then
		term.setBackgroundColor(colors.gray)
		term.setTextColor(colors.white)
		cLib.cText("                                      ",2)
		cLib.cText("WTC - Help",2)
		cLib.cText("                                      ",3)
		cLib.cText("                                      ",4)
		cLib.cText("                                      ",5)
		cLib.cText("                                      ",6)
		cLib.cText("                                      ",7)
		cLib.cText("                                      ",8)
		cLib.cText("                                      ",9)
		cLib.cText("                                      ",10)
		cLib.cText("                                      ",11)
		cLib.cText("                                      ",12)
		---------------------------
		term.setBackgroundColor(colors.lightGray)
		term.setTextColor(colors.black)
		cLib.cText("WASD - Moves turtle.                ",3)
		cLib.cText("Q - Drops selected item.            ",4)
		cLib.cText("Bsp - Breaks opposed block.         ",5)
		cLib.cText("Ent - Places selected block.        ",6)
		cLib.cText("1-9 - Selects turtles Inventory     ",7)
		cLib.cText("^ - Digs & Goes up then places down.",8)
		cLib.cText("v - Digs & Goes down then places up.",9)
		cLib.cText("</> - Digs the block below/above.   ",10)
		cLib.cText("Tab - Closes program.               ",11)
		term.setTextColor(colors.white)
		helpCheck = false
    elseif helpCheck == false then
        drawWTC()
		helpCheck = true
	end
end
drawWTC()
while true do
local sEvent ,param ,X ,Y = os.pullEvent()
    if(sEvent == "key") then
        if(param == 17) then --W
            turtle.forward()
        elseif (param == 31) then --S
            turtle.back()
        elseif (param == 30) then--A
            turtle.turnLeft()
        elseif (param == 32) then--D
            turtle.turnRight()
        elseif (param == 28) then--'Enter'
            turtle.place()
        elseif (param == 14) then--'Backspace'
            turtle.dig()
        elseif (param == 42) then--'Left Shift'
            turtle.down()
        elseif (param == 57) then--'Space'
            turtle.up()
        elseif (param == 200) then--'Up Arrow'
          turtle.digUp()
          sleep(0.1)
          turtle.up()
          sleep(0.4)
          turtle.placeDown()
        elseif (param == 208) then--'Down Arrow'
          turtle.digDown()
          sleep(0.1)
          turtle.down()
          sleep(0.4)
          turtle.placeUp()
        elseif (param == 203) then--'Left Arrow'
            turtle.digDown()
        elseif (param == 205) then--'Right Arrow'
            turtle.digUp()
        elseif (param == 16) then--'Q'
            turtle.drop()
        elseif (param == 2) or (param == 79) then--'Select Inventory Slot'
            turtle.select(1)
        elseif (param == 3) or (param == 80) then--'Select Inventory Slot'
            turtle.select(2)
        elseif (param == 4) or (param == 81) then--'Select Inventory Slot'
            turtle.select(3)
        elseif (param == 5) or (param == 82) then--'Select Inventory Slot'
            turtle.select(4)
        elseif (param == 6) or (param == 83) then--'Select Inventory Slot'
            turtle.select(5)
        elseif (param == 7) or (param == 84) then--'Select Inventory Slot'
            turtle.select(6)
        elseif (param == 8) or (param == 85) then--'Select Inventory Slot'
            turtle.select(7)
        elseif (param == 9) or (param == 86) then--'Select Inventory Slot'
            turtle.select(8)
        elseif (param == 10) or (param == 87) then--'Select Inventory Slot'
            turtle.select(9)
        elseif (param == 35) then -- -H- Help
            drawHelp()
        elseif (param == 15) then
          break
        end
    end
end
