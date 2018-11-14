ret = do
  name: \bounce-alt
  desc: ''
  edit: do
    iterations: default: 0, type: \number, min: 0, max: 10
    accelerate: default: 0.5, type: \number, min: 0, max: 1, step: 0.1
    decay: default: 0.5, type: \number, min: 0, max: 1, step: 0.1
    power: default: 0, type: \number, min:0, max: 10, step: 0.1
    offset: default: -14, type: \number, unit: \px, min: -100, max: 100
  code: (config) ->  
    """
    bounce("ld-bounce-alt", config.dur, config.iterations, config.accelerate, config.decay, config.power, config.offset,@(v) { transform: translate(0,v) })
    """

if module? => module.exports = ret
