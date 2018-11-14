ret = do
  name: \surprise
  desc: ''
  edit: do
    dur: default: 1
    zoom_min: default: 0.1, type: \number, min: 0, max: 10, step: 0.1
    zoom_max: default: 1.1, type: \number, min: 0, max: 10, step: 0.1
    skew: default: 35, type: \number, unit: \deg, min: -90, max: 90
  code: (config) ->  
    """
    @keyframes ld-surprise
      0%
        transform: skewX(0deg) scale(1)
      10%
        transform: skewX(-1 * config.skew) scale(config.zoom_min)
      20%
        transform: skewX(-1 * config.skew) scale(config.zoom_min)
      30%
        transform: skewX(config.skew) scale(config.zoom_max)
      40%
        transform: skewX(-1 * config.skew) scale(config.zoom_max)
      50%
        transform: skewX(config.skew) scale(config.zoom_max)
      60%
        transform: skewX(-1 * config.skew) scale(config.zoom_max)
      70%
        transform: skewX(config.skew) scale(config.zoom_max)
      80%
        transform: skewX(-1 * config.skew) scale(config.zoom_max)
      90%
        transform: skewX(config.skew) scale(config.zoom_max)
      100%
        transform: skewX(-1 * config.skew) scale(config.zoom_max)

    .ld-surprise
      animation: ld-surprise config.dur linear infinite

    """

if module? => module.exports = ret
