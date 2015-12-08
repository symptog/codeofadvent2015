fs = require 'fs'

fs.readFile '../advent_1_input.txt', 'utf8', (err,data) ->
  if err
    console.error err
  else
    floor = 0
    counter = 1
    found = false
    for d in data
      if d is '('
        floor += 1
      if d is ')'
        floor -= 1
      if floor is -1 and not found
        console.log counter
        found = true
      counter += 1
    console.log floor
