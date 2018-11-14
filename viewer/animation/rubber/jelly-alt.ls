ret = do
  name: \jelly-alt
  desc: ''
  edit: do
    iterations: default: 7, type: \number, min: 0, max: 50
    offset: default: 1, type: \number, min: -10, max: 10, step: 0.1
    ratio: default: 0.7, type: \number, min: 0, max: 1, step: 0.1
    delay: default: 30, type: \number, min: 0, max: 100, step: 0.1
  code: (config) ->  
     """
     rubber("ld-jelly-alt", config.dur, config.iterations, config.offset, config.ratio, config.delay, @(v) {
       animation-timing-function: ease-out
       transform: skewX(v * 10deg);
     })"""

if module? => module.exports = ret
