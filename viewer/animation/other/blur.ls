ret = do
  name: \blur
  desc: ''
  edit: do
    blur: default: 10, type: \number, unit: \px, min: 0, max: 100
  code: (config) ->  
    """
    @keyframes ld-blur
      0%
        filter: blur(0)
      50%
        filter: blur(config.blur)
      100%
        filter: blur(0)
    .ld-blur
      animation: ld-blur config.dur linear infinite

    """

if module? => module.exports = ret
