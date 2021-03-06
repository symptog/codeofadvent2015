fs = require 'fs'

is_nice = (s) ->
  vowels = 0
  double = false
  naughty = false
  for d, i in s
    if d is 'a' or d is 'e' or d is 'i' or d is 'o' or d is 'u'
      vowels += 1
    ds = s[i+1]
    if ds != undefined
      if d is ds
        double = true
      dds = d + ds
      if dds is 'ab' or dds is 'cd' or dds is 'pq' or dds is 'xy'
        naughty = true
        break
  vowels > 2 and double and not naughty

fs.readFile '../advent_5_input.txt', 'utf8', (err,data) ->
  if err
    console.error err
  else
    lines = data.split('\n').filter((x) -> x != '')
    console.log "nice lines:", lines.filter(is_nice).length


# Tests

#console.log is_nice('ugknbfddgicrmopn')
#console.log is_nice('jchzalrnumimnmhp')
#console.log is_nice('haegwjzuvuyypxyu')
#console.log is_nice('dvszwmarrgswjxmb')
