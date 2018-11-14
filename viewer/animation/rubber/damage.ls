ret = do
  name: \damage
  desc: ''
  edit: do
    iterations: default: 10, type: \number, min: 0, max: 50
    offset: default: 1, type: \number, min: 0, max: 1, step: 0.1 
    ratio: default: 0.8, type: \number, min: 0, max: 1, step: 0.1
    delay: default: 20, type: \number, min: 0, max: 100, step: 0.1
  code: (config) ->  
     """
     rubber("ld-damage", config.dur, config.iterations, config.offset, config.ratio, config.delay, @(v) {
       animation-timing-function: ease-out;
       opacity: 1 - v;
     })"""

if module? => module.exports = ret
