ret = do
  name: \bounce
  desc: ''
  edit: do
    accelerate: default: 0.4, type: \number, min: 0, max: 1
    zoom_max: default: 1.1, type: \number, min: 1, max: 2, step: 0.1
    zoom_min: default: 0.5, type: \number, min: 0, max: 1, step: 0.1
    offset_top: default: 27, type: \number, unit: \px, min: 0, max: 3000
    offset_bottom: default: 30, type: \number, unit: \px, min: 0, max: 3000

  code: (config) ->  
    """
    @keyframes ld-bounce
      0%, 90%
        animation-timing-function: linear
      10%
        timing-speed-down(config.accelerate)
      50%
        timing-speed-up(config.accelerate)
      0%
        transform: translate(0,config.offset_bottom) scaleY(config.zoom_min)
      10%
        transform: translate(0,5%) scaleY(config.zoom_max)
      50%
        transform: translate(0,-1 * config.offset_top) scaleY(config.zoom_max)
      90%
        transform: translate(0,5%) scaleY(config.zoom_max)
      100%
        transform: translate(0,config.offset_bottom) scaleY(config.zoom_min)
    .ld-bounce
      animation: ld-bounce config.dur infinite
    """

if module? => module.exports = ret
