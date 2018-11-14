ret = do
  name: \metronome
  desc: ''
  edit: do
    accelerate: default: 0.6, type: \number, min: 0, max: 1
    offset: default: 10, type: \number, unit: \px, min: 0, max: 30
    rotate: default: 30, type: \number, unit: \deg, min: 0, max: 30
  code: (config) ->  
     """patrol("ld-metronome", config.dur, config.accelerate, 1, @(v) {
       transform: translate(v * config.offset,0) rotate(v * config.rotate)
     })"""

if module? => module.exports = ret
