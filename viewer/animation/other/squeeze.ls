ret = do
  name: \squeeze
  desc: ''
  edit: do
    accelerate: default: 0.7, type: \number, min: 0, max: 1
    zoom_x: default: 0.5, type: \number, min: 0, max: 3, step: 0.1
    zoom_y: default: 0.5, type: \number, min: 0, max: 3, step: 0.1

  code: (config) ->  
    """
    @keyframes ld-squeeze
      0%
        transform: scale(1,config.zoom_y)
      50%
        transform: scale(config.zoom_x,1)
      100%
        transform: scale(1,config.zoom_y)
    .ld-squeeze
      animation: ld-squeeze config.dur infinite
      timing-speed-down(config.accelerate)
    """

if module? => module.exports = ret
