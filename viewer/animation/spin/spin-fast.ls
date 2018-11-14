ret = do
  name: \spin-fast
  desc: ''
  edit: do
    accelerate: default: 0.4, type: \number, min: 0, max: 1
    cycle: default: 1800, type: \number, unit: \deg, min: 0, max: 3600, step: 360
  code: (config) ->  
     """spin("ld-spin-fast", config.dur, config.accelerate, config.cycle, @(v) {
       transform: rotate(v)
     })"""

if module? => module.exports = ret
