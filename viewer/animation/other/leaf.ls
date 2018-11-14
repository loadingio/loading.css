ret = do
  name: \leaf
  desc: ''
  edit: do
    dur: default: 4
    count: default: 6, type: \number, min: 0, max: 20, step: 2
    accelerate: default: 0.3, type: \number, min: 0, max: 1
    offset_y: default: 200, type: \number, unit: \px, min: 0, max: 1000
    offset_x: default: 30, type: \number, unit: \px, min: 0, max: 1000
    degree: default: 30, type: \number, unit: \deg, min: 0, max: 90
  code: (config) ->  
    """
    @keyframes ld-leaf
      sgn = 1
      for i in (0..config.count)
        y1 = (i * config.offset_y / config.count) - config.offset_y * 0.5
        y2 = ((i + 0.3) * config.offset_y / config.count) - config.offset_y * 0.5
        {100 * i/config.count * 1%}
          timing-speed-down(config.accelerate)
          transform: translate(1px * sgn * config.offset_x,y1) rotate(0)
        {100 * (i + 0.5)/config.count * 1%}
          timing-speed-up(config.accelerate)
          transform: translate(-.5px * sgn * config.offset_x,y2) rotate(config.degree * sgn * 1)
        sgn = sgn * -1

    .ld-leaf
      animation: ld-leaf config.dur linear infinite

    """

if module? => module.exports = ret
