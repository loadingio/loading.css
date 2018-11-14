ret = do
  name: \cycle
  desc: ''
  edit: do
    accelerate: default: 0.0, type: \number, min: 0, max: 1
    cycle: default: 360, type: \number, unit: \deg, min: 0, max: 3600, step: 360
  code: (config) ->  
     """spin("ld-cycle", config.dur, config.accelerate, config.cycle, @(v) {
       transform: rotate(v)
     })"""

if module? => module.exports = ret
