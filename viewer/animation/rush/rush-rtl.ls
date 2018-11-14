ret = do
  name: \rush-rtl
  desc: ''
  edit: do
    accelerate: default: 0.6, type: \number, min: 0, max: 1
    offset_near: default: 20, type: \number, unit: \px, min: 0, max: 1000
    offset_far: default: 200, type: \number, unit: \px, min: 0, max: 1000
    direction: default: -1, type: \number, min: -1, max: 1, step: 2
    percent_in: default: 70, type: \number, unit: \%, min: 0, max: 100
    percent_out: default: 80, type: \number, unit: \%, min: 0, max: 100
    skew: default: 15, type: \number, unit: \deg, min: 0, max: 360 

  code: (config) ->  
     """rush("ld-rush-rtl", config.dur, config.accelerate, config.offset_near, config.offset_far, config.direction, config.percent_in, config.percent_out, config.skew)"""

if module? => module.exports = ret
