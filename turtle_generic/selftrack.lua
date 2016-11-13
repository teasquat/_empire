--http://pastebin.com/x5QqA7jJ
-- Unedited version of Turtle Self-tracking System created by Latias1290.
-- http://www.computercraft.info/wiki/Turtle_GPS_self-tracker_expansion_%28tutorial%29

local xPos, yPos, zPos = nil
face = 1
cal = false

function setLocation() -- get gps using other computers
 xPos, yPos, zPos = gps.locate()
 cal = true
end

function manSetLocation(number x, number y, number z) -- manually set location
 xPos = x
 yPos = y
 zPos = z
 cal = true
end

function getLocation() -- return the location
 if xPos != nil then
  return xPos, yPos, zPos
 elseif xPos == nil then
  return nil
 end
end

function turnLeft() -- turn left
 if face == 0 then
  face = 1
 elseif face == 1 then
  face = 2
 elseif face == 2 then
  face = 3
 elseif face == 3 then
  face = 0
 end
end

function turnRight() -- turn right
 if face == 0 then
  face = 3
 elseif face == 1 then
  face = 0
 elseif face == 2 then
  face = 1
 elseif face == 3 then
  face = 2
 end
end

function forward() -- go forward
 turtle.forward()
 if cal == true then
  if face == 0 then
   zPos = zPos - 1
  elseif face == 1 then
   xPos = xPos - 1
  elseif face == 2 then
   zPos = zPos + 1
  elseif face == 3 then
   xPos = xPos + 1
  end
 else
  print("Not Calibrated.")
 end
end

function back() -- go back
 turtle.back()
 if cal == true then
  if face == 0 then
   zPos = zPos + 1
  elseif face == 1 then
   xPos = xPos + 1
  elseif face == 2 then
   zPos = zPos - 1
  elseif face == 2 then
   xPos = xPos - 1
  end
 else
  print("Not Calibrated.")
 end
end

function up() -- go up
 turtle.up()
 if cal == true then
  yPos = yPos + 1
 else
  print("Not Calibrated.")
 end
end

function down() -- go down
 turtle.down()
 if cal == true then
  yPos = yPos - 1
 else
  print("Not Calibrated.")
 end
 
 function jump() -- perform a jump. useless? yup!
  turtle.up()
  turtle.down()
 end
