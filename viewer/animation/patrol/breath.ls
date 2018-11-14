ret = do
  name: \breath
  desc: ''
  edit: do
    accelerate: default: 0.6, type: \number, min: 0, max: 1
    scale: default: 0.06, type: \number, min: 0, max: 1
  code: (config) ->  
    """patrol("ld-breath", config.dur, config.accelerate, config.scale, @(v) {
      transform: scale(1 + v * 2 - 0.03)
    })"""

if module? => module.exports = ret
