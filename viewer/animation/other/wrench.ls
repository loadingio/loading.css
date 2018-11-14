ret = do
  name: \wrench
  desc: ''
  edit: do
    dur: default: 1
    rotate: default: 45, type: \number, unit: \deg, min: 0, max: 360
  code: (config) ->  
    """
    @keyframes ld-wrench
      20%, 36%, 70%, 86%
        transform: rotate(0deg)
      0%, 50%, 100%
        transform: rotate(config.rotate * 1deg)
    .ld-wrench
      animation: ld-wrench config.dur linear infinite

    """

if module? => module.exports = ret
