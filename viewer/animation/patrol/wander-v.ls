ret = do
  name: \wander-v
  desc: ''
  edit: do
    accelerate: default: 0.6, type: \number, min: 0, max: 1
    offset: default: 10, type: \number, unit: \px, min: 0, max: 30
  code: (config) ->  
     """patrol("ld-wander-v", config.dur, config.accelerate, config.offset, @(v) {
       transform: translate(0,v * 1px)
     })"""

if module? => module.exports = ret
