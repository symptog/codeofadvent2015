fs = require 'fs'

wrap = (line) ->
  lbh = line.split('x').map((x) -> parseInt(x))
  flaechen = [lbh[0]*lbh[1], lbh[1]*lbh[2], lbh[2]*lbh[0]]
  min = Math.min.apply null, flaechen
  summe = flaechen.map((x) -> 2*x).reduce(((a,b) -> a+b), 0)
  summe + min

ribbon = (line) ->
  lbh = line.split('x').map((x) -> parseInt(x))
  lbh_2 = lbh.slice()
  min_1 = Math.min.apply null, lbh
  lbh_2.splice(lbh.indexOf(min_1), 1)
  min_2 = Math.min.apply null, lbh_2
  min_1*2 + min_2*2 + lbh.reduce(((a,b) -> a*b), 1)


fs.readFile '../advent_2_input.txt', 'utf8', (err,data) ->
  if err
    console.error err
  else
    lines = data.split('\n').filter((x) -> x != '')
    overall_wrap = 0
    overall_ribbon = 0
    for line in lines
      overall_wrap += wrap line
      overall_ribbon += ribbon line
    console.log "wrap:", overall_wrap
    console.log "ribbon:", overall_ribbon

# Test
#console.log wrap("2x3x4") is 58
#console.log ribbon("2x3x4") is 34
#console.log ribbon("1x1x10") is 14
