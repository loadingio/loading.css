ret = do
  name: \vortex-out
  desc: ''
  edit: do
    dur: default: 2
    accelerate: default: 0.4, type: \number, min: 0, max: 1
    rotate: default: 5, type: \number, min: 0, max: 20
    zoom: default: 0, type: \number, min: 0, max: 10

  code: (config) ->  
    """
    @keyframes ld-vortex-out
      0%
        transform: rotate(360deg * config.rotate) scale(config.zoom)
        opacity: 0
      60%
        transform: rotate(0deg) scale(1)
        opacity: 1
      100%
        opacity: 0

    .ld-vortex-out
      animation: ld-vortex-out config.dur infinite
      timing-speed-up(config.accelerate)
    """

if module? => module.exports = ret
