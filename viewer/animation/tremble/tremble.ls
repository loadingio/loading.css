ret = do
  name: \tremble
  desc: ''
  edit: do
    iterations: default: 30, type: \number, min: 0, max: 100
    offset: default: 4, type: \number, unit: \px, min: 0, max: 30
    degree: default: 0, type: \number, unit: \degree, min: 0, max: 360
    zoom: default: 0.0, type: \number, min: 0, max: 2
  code: (config) ->  
     """tremble("ld-tremble", config.dur, config.iterations, config.offset, config.degree, config.zoom)"""

if module? => module.exports = ret
