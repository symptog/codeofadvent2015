crypto = require 'crypto'

checksum = (str, algorithm, encoding) ->
  crypto
    .createHash(algorithm || 'md5')
    .update(str, 'utf8')
    .digest(encoding || 'hex')

input = "bgvyzdsv"

num = 1
found_5 = false
found_6 = false

while true
  check = checksum input+num.toString()
  if check.match /^00000/g and not found_5
    console.log num+':', check
    found_5 = true
  if check.match /^000000/g and not found_6
    console.log num+':', check
    found_6 = true
  if found_5 and found_5
    break
  num += 1
