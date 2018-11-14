ret = do
  name: \float
  desc: ''
  edit: do
    dur: default: 1
    accelerate: default: 0.4, type: \number, min: 0, max: 1, step: 0.1
    offset: default: 15, type: \number, unit: \px, min: 0, max: 1000
    zoom: default: 0.7, type: \number, min: 0, max: 1, step: 0.1
    shadow_offset: default: 23, type: \number, unit: \px, min: 0, max: 1000
    shadow_blur: default: 5, type: \number, unit: \px, min: 0, max: 100
    shadow_expand: default: -15, type: \number, unit: \px, min: -1000, max: 1000
  code: (config) ->  
    """
    @keyframes ld-float
      0%
        transform: translate(0,0) scale(config.zoom)
        box-shadow: 0 0 0 rgba(0,0,0,.3)
        timing-speed-down(config.accelerate)
      50%
        transform: translate(0,-1px * config.offset) scale(1)
        timing-speed-up(config.accelerate)
        box-shadow: 0 config.shadow_offset config.shadow_blur config.shadow_expand rgba(0,0,0,.2)
      100%
        transform: translate(0,0) scale(config.zoom)
        box-shadow: 0 0 0 rgba(0,0,0,.3)
    .ld-float
      animation: ld-float config.dur linear infinite

    """

if module? => module.exports = ret
