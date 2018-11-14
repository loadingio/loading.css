ret = do
  name: \jelly
  desc: ''
  edit: do
    iterations: default: 5, type: \number, min: 0, max: 50
    offset: default: 1, type: \number, min: -10, max: 10, step: 0.1
    ratio: default: 0.6, type: \number, min: 0, max: 1, step: 0.1
    delay: default: 30, type: \number, min: 0, max: 100, step: 0.1
  code: (config) ->  
     """
     rubber("ld-jelly", config.dur, config.iterations, config.offset, config.ratio, config.delay, @(v) {
       animation-timing-function: ease-out
       transform: translate(v * -10px,0) skewX(v * 10deg);
     })"""

if module? => module.exports = ret
