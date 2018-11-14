ret = do
  name: \dim
  desc: ''
  edit: do
    accelerate: default: 0.6, type: \number, min: 0, max: 1
    opacity: default: 0.5, type: \number, min: 0, max: 0.5
  code: (config) ->  
    """patrol("ld-dim", config.dur, config.accelerate, config.opacity, @(v) {
      opacity: 0.5 + v
    })"""

if module? => module.exports = ret
