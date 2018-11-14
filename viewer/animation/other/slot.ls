ret = do
  name: \slot
  desc: ''
  edit: do
    dur: default: 6
    count: default: 12, type: \number, min: 4, max: 50
    offset: default: 100, type: \number, unit: \px, min: 0, max: 10000
    variation: default: 1.1, type: \number, min: 0, max: 10, step: 0.1
  code: (config) ->  
    """
    @keyframes ld-slot
      sum = 0
      for i in (0..config.count)
        x = (i - config.count * 0.5)
        sum = sum + (1/(1 + config.variation * x * x))
      cur = 0
      for i in (0..config.count)
        x = (i - config.count * 0.5)
        offset = ((1/(1 + config.variation * x * x))) * 100 / sum
        {cur * 1%}
          transform: translate(0,-1px * config.offset)
        {(cur + offset - 0.01) * 1%}
          transform: translate(0,1px * config.offset)
        cur = cur + offset
      100%
        transform: translate(0,-1px * config.offset)

    .ld-slot
      animation: ld-slot config.dur linear infinite

    """

if module? => module.exports = ret
