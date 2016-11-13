width  = 300
height = 6
depth  = 300

with turtle
  x = 1
  y = 1

  row = (h) ->
    for n = 1, h
      .digDown!
      .down!
    for n = 1, h
      .up!

  while x < width
    for n = 1, depth
      .row!
      .digForward!
      .forward!
    x += 1

    .turnRight!
    .dig!
    .forward!
    .turnRight!
