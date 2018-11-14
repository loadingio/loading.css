ret = do
  name: \hit
  desc: ''
  edit: do
    dur: default: 2.0
    accelerate: default: 0.5, type: \number, min: 0, max: 1
    zoom: default: 1, type: \number, min: 0, max: 10
    skew: default: 20, type: \number, unit: \deg, min: -90, max: 90
    offset: default: 200, type: \number, unit: \px, min: 0, max: 10000
  code: (config) ->  
    """
    @keyframes ld-hit
      0%
        timing-speed-up(config.accelerate)
        transform: scale(0) translate(0,0) skewX(0)
      20%
        transform: scale(config.zoom) translate(0,0) skewX(config.skew)
      50%
        //animation-timing-function: cubic-bezier(1,0,1,.5)
        timing-speed-up(config.accelerate * 1.2)
        transform: scale(config.zoom) translate(0,0) skewX(config.skew)
      100%
        transform: scale(config.zoom)  translate(0,config.offset) skewX(config.skew)
    .ld-hit
      animation: ld-hit config.dur infinite

    """

if module? => module.exports = ret
