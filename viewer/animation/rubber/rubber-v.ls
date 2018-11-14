ret = do
  name: \rubber-v
  desc: ''
  edit: do
    iterations: default: 7, type: \number, min: 0, max: 50
    offset: default: 0.2, type: \number, min: 0, max: 2, step: 0.1
    ratio: default: 0.7, type: \number, min: 0, max: 1, step: 0.1
    delay: default: 30, type: \number, min: 0, max: 100, step: 0.1
  code: (config) ->  
     """
     rubber("ld-rubber-v", config.dur, config.iterations, config.offset, config.ratio, config.delay, @(v) {
       transform: scaleY(1 + v);
     })"""

if module? => module.exports = ret
