ret = do
  name: \blink
  desc: ''
  edit: do
    dur: default: 1
    showtime: default: 50, type: \number, min: 0, max: 100
    transitiontime: default: 1, type: \number, min: 0, max: 100
  code: (config) ->  
    """
    @keyframes ld-blink
      0%
        opacity: 1
      {config.showtime * 1%}
        opacity: 1
      {(config.transitiontime + config.showtime) * 1%}
        opacity: 0
      {(100 - config.transitiontime) * 1%}
        opacity: 0
      100%
        opacity: 1
    .ld-blink
      animation: ld-blink config.dur linear infinite

    """

if module? => module.exports = ret
