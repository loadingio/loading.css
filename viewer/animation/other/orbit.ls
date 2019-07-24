ret = do
  name: \orbit
  desc: ''
  edit: do
    radius: default: 60, type: \number, unit: \%, min: 0, max: 1000

  step: (t, config = {}) ->
    t = t - Math.floor(t)
    a = Math.PI * 2 * t
    tx = Math.sin(a) * config.radius
    ty = -1 * Math.cos(a) * config.radius
    rz = a
    return {tx, ty}, {rz}

  code: (config) ->  
    """
    @keyframes ld-orbit
      for i in (0..8)
        r = 360deg * i * 0.125
        a = 3.1415926 * 2 * i * 0.125
        x = math(a, 'sin') * config.radius
        y = -1 * math(a, 'cos') * config.radius
        {i * 12.5%}
          transform: translate(x,y) rotate(r)
    .ld-orbit
      animation: ld-orbit config.dur linear infinite

    """

if module? => module.exports = ret
