ret = do
  name: \shake
  desc: ''
  edit: do
    iterations: default: 5, type: \number, min: 0, max: 50
    offset: default: 10, type: \number, unit: \px, min: 0, max: 20, step: 1
    ratio: default: 0.6, type: \number, min: 0, max: 1, step: 0.1
    delay: default: 30, type: \number, min: 0, max: 100, step: 0.1
  code: (config) ->  
     """
     rubber("ld-shake", config.dur, config.iterations, config.offset, config.ratio, config.delay, @(v) {
       animation-timing-function: ease-out;
       transform: translate(v,0);
     })"""

if module? => module.exports = ret
