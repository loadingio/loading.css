ret = do
  name: \coin-v
  desc: ''
  edit: do
    dur: default: 2
    accelerate: default: 0.4, type: \number, min: 0, max: 1
    cycle: default: 3600, type: \number, unit: \deg, min: 0, max: 3600, step: 360
  code: (config) ->  
     """spin("ld-coin-v", config.dur, config.accelerate, config.cycle, @(v) {
       transform: rotateX(v)
     })"""

if module? => module.exports = ret
