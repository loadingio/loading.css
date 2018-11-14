ret = do
  name: \flip-h
  desc: ''
  edit: do
    dur: default: 2
    accelerate: default: 0.4, type: \number, min: 0, max: 1
    degree: default: 180, type: \number, unit: \deg, min: 0, max: 3600, step: 360
  code: (config) ->  
     """
     x1 = 1
     x2 = 0
     x3 = 0
     x4 = 1
     y1 = 1
     y2 = 1
     y3 = 0
     y4 = 0

     .ld-flip
       animation: ld-flip config.dur infinite
     @keyframes ld-flip
       0%, 25%, 50%, 75%, 100%
         timing-speed-down(config.accelerate)
       0%
         transform: rotateX(config.degree * x1) rotateY(config.degree * y1)
       25%
         transform: rotateX(config.degree * x2) rotateY(config.degree * y2)
       50%
         transform: rotateX(config.degree * x3) rotateY(config.degree * y3)
       75%
         transform: rotateX(config.degree * x4) rotateY(config.degree * y4)
       100%
         transform: rotateX(config.degree * x1) rotateY(config.degree * y1)
     """


if module? => module.exports = ret


