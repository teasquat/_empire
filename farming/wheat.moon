args = {...}

width = args[1]
length = args[2]
right = true

--preperations
if #args != 2
  error("Usage: wheat width length")
turtle.select(1)

is_mature = ->
  bool, data = turtle.inspectDown!
  if data.name =="minecraft:wheat" and data.state.age == 7
    true
  else
    false
process = ->
  if is_mature!
    turtle.digDown!
    turtle.placeDown!

turn = ->
  if right
    turtle.turnRight!
    turtle.forward!
    turtle.turnRight!
  else
    turtle.turnLeft!
    turtle.forward!
    turtle.turnLeft!
  right = not right

check_field = ->
  for x=1,width-1
    for y=1,length-1
      process!
      turtle.forward!
    turn!
  for y=1,length-1
    process!
    turtle.forward!

check_field!
