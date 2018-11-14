ret = do
  name: \bounce-a-alt
  desc: ''
  edit: do
    dur: default: 2
    offset_x: default: 20, type: \number, unit: \px, min: 0, max: 1000
    offset_y: default: 27, type: \number, unit: \px, min: 0, max: 3000

  code: (config) ->  
    """
    @keyframes ld-bounce-a-alt
      for i in (0..3)
        dx = 1 - math( 1 - i, 'abs' )
        sgn = math( i - 1.5, 'sign')
        {   0% + i * 25%}
          transform: translate((dx + sgn * 1) * config.offset_x, 0)
        { 4.2% + i * 25%}
          transform: translate((dx + sgn * 0.84) * config.offset_x, -0.55 * config.offset_y)
        { 8.4% + i * 25%}
          transform: translate((dx + sgn * 0.67) * config.offset_x, -0.88 * config.offset_y)
        {12.5% + i * 25%}
          transform: translate((dx + sgn * 0.5) * config.offset_x, -1 * config.offset_y)
        {16.7% + i * 25%}
          transform: translate((dx + sgn * 0.34) * config.offset_x, -0.88 * config.offset_y)
        {20.9% + i * 25%}
          transform: translate((dx + sgn * 0.17) * config.offset_x, -0.55 * config.offset_y)
      100%
        transform: translate(-1 * config.offset_x, 0)

    .ld-bounce-a-alt
      animation: ld-bounce-a-alt config.dur infinite linear
    """

if module? => module.exports = ret
