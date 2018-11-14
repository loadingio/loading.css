
ret = do
  name: \tick-alt
  desc: ''
  edit: do
    iterations: default: 5, type: \number, min: 0, max: 10
    accelerate: default: 0.4, type: \number, min: 0, max: 1, step: 0.1
    decay: default: 0.6, type: \number, min: 0, max: 1, step: 0.1
    power: default: 1.1, type: \number, min:0, max: 10, step: 0.1
    offset: default: -45, type: \number, unit: \deg, min: -100, max: 100
  code: (config) ->  
    """
    bounce("ld-tick-alt", config.dur, config.iterations, config.accelerate, config.decay, config.power, config.offset,@(v) { transform: rotate(v) })
    """

if module? => module.exports = ret
