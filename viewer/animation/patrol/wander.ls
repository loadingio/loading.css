ret = do
  name: \wander
  desc: ''
  edit: do
    accelerate: default: 0.6, type: \number, min: 0, max: 1
    offset: default: 10, type: \number, unit: \px, min: 0, max: 30
  code: (config) ->  
     """patrol("ld-wander", config.dur, config.accelerate, config.offset, @(v) {
       transform: translate(v * 1px,0)
     })"""

if module? => module.exports = ret
