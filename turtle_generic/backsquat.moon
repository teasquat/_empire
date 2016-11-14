x_pos, y_pos, z_pos
face = 1
cal = false

set_location = -> -- get gps using other computers
  x_pos, y_pos, z_pos = gps.locate!
  cal = true


man_set_location = (number x, number y, number z) -> -- manually set location
  x_pos = x
  y_pos = y
  z_pos = z
  cal = true


get_location = -> -- return the location
  if x_pos != nil
    return x_pos, y_pos, z_pos
  elseif x_pos == nil
    return nil



turn_left = -> -- turn left
  if face == 0
    face = 1
  elseif face == 1
    face = 2
  elseif face == 2
    face = 3
  elseif face == 3
    face = 0



turn_right = -> -- turn right
  if face == 0
    face = 3
  elseif face == 1
    face = 0
  elseif face == 2
    face = 1
  elseif face == 3
    face = 2



forward = (number n = 1) -> -- go forward
  for i=1, n
    turtle.forward!
    if cal == true
      if face == 0
        z_pos = z_pos - 1
      elseif face == 1
        x_pos = x_pos - 1
      elseif face == 2
        z_pos = z_pos + 1
      elseif face == 3
        x_pos = x_pos + 1

    else
      print("Not Calibrated.")



back = (number n = 1) -> -- go back
  for i=1, n
    turtle.back!
    if cal == true
      if face == 0
        z_pos = z_pos + 1
      elseif face == 1
        x_pos = x_pos + 1
      elseif face == 2
        z_pos = z_pos - 1
      elseif face == 2
        x_pos = x_pos - 1

    else
      print("Not Calibrated.")



up = -> -- go up
  turtle.up!
  if cal == true
    y_pos = y_pos + 1
  else
    print("Not Calibrated.")



down = -> -- go down
  turtle.down!
  if cal == true
    y_pos = y_pos - 1
  else
    print("Not Calibrated.")


jump = -> -- perform a jump. useless? yup!
  turtle.up!
  turtle.down!
