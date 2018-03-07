key = [0,4,13,15,33,50,67,81,90,96,100]

count = 7
d1 = 1 / count
d2 = 2 / count

for j from 0 til count
  for i in key
    t = i / 100
    p = (i * d1 + j * d1 * 100)
    x = Math.round(Math.pow(t, 3) * 100) * 0.01 
    x = Math.round( 100 * 
      #(Math.pow(Math.E, (t - 0.5)* 15) / (Math.pow(Math.E, (t - 0.5) * 15) + 20))
      (Math.pow(Math.E, (t * 0.7 - 0.1)* 15) / (Math.pow(Math.E, (t * 0.7 - 0.1) * 15) + 20))
    ) * 0.01
    y = j * d2 + Math.round((1 - Math.pow(1 - t, 3)) * 100) * 0.01 * d2 - 0.5 - d2 * 1
    a = x * (if (j % 2) == 1 => -1 else 1)
    if (j % 2) == 1 => x = 1 - x
    x = x - 0.5
    console.log "  #{Math.round(p)}%"
    console.log "    transform: translate(#x * dx,#y * dy) rotate(#{a} * angle)"
