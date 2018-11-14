ret = do
  name: \tick
  desc: ''
  edit: do
    iterations: default: 7, type: \number, min: 0, max: 50
    offset: default: 20, type: \number, unit: \deg, min: -360, max: 360, step: 1
    ratio: default: 0.7, type: \number, min: 0, max: 1, step: 0.1
    delay: default: 30, type: \number, min: 0, max: 100, step: 0.1
  code: (config) ->  
     """
     rubber("ld-tick", config.dur, config.iterations, config.offset, config.ratio, config.delay, @(v) {
       transform: rotate(v);
     })"""

if module? => module.exports = ret
