f = -> (it - 0.5) * (it - 0.5)
sum = 0
count = 30
for i from 0 to count
  p = i / count
  dp = f(p)
  sum += dp

out = (add,next) ->
  console.log "  #{Math.round(add/sum * 1000) / 10}%"
  console.log "    transform: translate(0,-1 * dy)"
  if add/sum * 100 < 100 =>
    console.log "  #{Math.round(next/sum * 1000) / 10 - 0.01}%"
    console.log "    transform: translate(0,1 * dy)"
add = 0
for i from 0 to count + 1
  p = i / count
  dp = f(p)
  out add, add + dp
  add = add + dp

