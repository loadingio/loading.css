ret = do
  name: \fade
  desc: ''
  edit: do
    dur: default: 1
  code: (config) ->  
    """
    @keyframes ld-fade
      0%
        opacity: 1
      100%
        opacity: 0
    .ld-fade
      animation: ld-fade config.dur linear infinite

    """

if module? => module.exports = ret
