ret = do
  name: \swim
  desc: ''
  edit: do
    dur: default: 6
    iterations: default: 7, type: \number, min: 0, max: 100
    offset: default: 12, type: \number, unit: \px, min: 0, max: 30
    degree: default: 20, type: \number, unit: \degree, min: 0, max: 360
    zoom: default: 0.0, type: \number, min: 0, max: 2
  code: (config) ->  
     """tremble("ld-swim", config.dur, config.iterations, config.offset, config.degree, config.zoom)"""

if module? => module.exports = ret
