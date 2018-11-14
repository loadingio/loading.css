ret = do
  name: \heartbeat
  desc: ''
  edit: do
    dur: default: 0.8
    accelerate: default: 0.5, type: \number, min: 0, max: 1
    offset: default: 10, type: \number, unit: \px, min: 0, max: 30
    max: default: 1.25, type: \number, min: 1.05, max: 2
    min: default: 0.9, type: \number, min: 0, max: 1
  code: (config) ->  
    """
    @keyframes ld-heartbeat
      0%
        transform: scale(1.05)
      5%
        transform: scale(config.max)
      39%
        transform: scale(config.min)
      45%
        transform: scale(1 + (config.max - 1) * 0.5)
      60%
        transform: scale(1.05)
      100%
        transform: scale(1.00)

    .ld-heartbeat
      animation: ld-heartbeat config.dur infinite
      timing-speed-down(config.accelerate)
    """

if module? => module.exports = ret
