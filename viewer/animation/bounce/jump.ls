
ret = do
  name: \jump
  desc: ''
  edit: do
    iterations: default: 5, type: \number, min: 0, max: 10
    accelerate: default: 0.4, type: \number, min: 0, max: 1, step: 0.1
    decay: default: 0.6, type: \number, min: 0, max: 1, step: 0.1
    power: default: 1.1, type: \number, min:0, max: 10, step: 0.1
    offset: default: -14, type: \number, unit: \px, min: -100, max: 100
  code: (config) ->  
    """
    bounce("ld-jump", config.dur, config.iterations, config.accelerate, config.decay, config.power, config.offset,@(v) { transform: translate(0,v) })
    """

if module? => module.exports = ret
