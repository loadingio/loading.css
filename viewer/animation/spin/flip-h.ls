ret = do
  name: \flip-h
  desc: ''
  edit: do
    accelerate: default: 0.4, type: \number, min: 0, max: 1
    cycle: default: 360, type: \number, unit: \deg, min: 0, max: 3600, step: 360
  code: (config) ->  
     """spin("ld-flip-h", config.dur, config.accelerate, config.cycle, @(v) {
       timing-speed-down(config.accelerate)
       transform: rotateY(v)
     })"""

if module? => module.exports = ret
