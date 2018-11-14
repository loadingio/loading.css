ret = do
  name: \swing
  desc: ''
  edit: do
    accelerate: default: 0.6, type: \number, min: 0, max: 1
    offset: default: 30, type: \number, unit: \px, min: 0, max: 30
    rotate: default: 30, type: \number, unit: \deg, min: 0, max: 30
  code: (config) ->  
    """patrol("ld-swing", config.dur, config.accelerate, config.rotate, @(v) { transform: rotate(v) })"""

if module? => module.exports = ret
