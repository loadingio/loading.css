
ret = do
  name: \pulse
  desc: ''
  edit: do
    dur: default: 0.5
    iterations: default: 0, type: \number, min: 0, max: 10
    accelerate: default: 0.4, type: \number, min: 0, max: 1, step: 0.1
    decay: default: 0.5, type: \number, min: 0, max: 1, step: 0.1
    power: default: 1.1, type: \number, min:0, max: 10, step: 0.1
    offset: default: 0.2, type: \number, min: 0, max: 1
  code: (config) ->  
    """
    bounce("ld-pulse", config.dur, config.iterations, config.accelerate, config.decay, config.power, config.offset,@(v) { transform: scale(1 - config.offset + v) })
    """

if module? => module.exports = ret
