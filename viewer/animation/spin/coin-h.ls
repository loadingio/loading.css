ret = do
  name: \coin-h
  desc: ''
  edit: do
    dur: default: 2
    accelerate: default: 0.4, type: \number, min: 0, max: 1
    cycle: default: 3600, type: \number, unit: \deg, min: 0, max: 3600, step: 360
  code: (config) ->  
     """spin("ld-coin-h", config.dur, config.accelerate, config.cycle, @(v) {
       transform: rotateY(v)
     })"""

if module? => module.exports = ret
