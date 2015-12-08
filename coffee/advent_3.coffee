fs = require 'fs'

compute = (data) ->
  x = 0
  y = 0
  lookup = [{ '0_0': {x: x, y: y}}]
  for d in data
    if d is '>'
      x += 1
    if d is '<'
      x -= 1
    if d is '^'
      y += 1
    if d is 'v'
      y -= 1
    obj = { x: x, y: y}
    key = '' + x + '_' + y
    if key not in lookup
      lookup[key]=obj
  Object.keys(lookup).length

compute2 = (data) ->
  num = 0
  data_1 = []
  data_2 = []
  while num < data.length
    data_1+=data[num]
    num += 2
  num = 1
  while num < data.length
    data_2+=data[num]
    num += 2
  compute(data_1) + compute(data_2) - 1

fs.readFile '../advent_3_input.txt', 'utf8', (err,data) ->
  if err
    console.error err
  else
    console.log "1:", compute data
    console.log "2:", compute2 data

# Tests
#console.log compute(">") is 2
#console.log compute("^v^v^v^v^v") is 2

#console.log compute2("^v^v^v^v^v") is 11
#console.log compute2("^v") is 3
#console.log compute2("^>v<") is 3
