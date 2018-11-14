
http = (option={}) -> new Promise (res, rej) ->
  xhr = new XMLHttpRequest!
  xhr.onreadystatechange = ->
    if @readyState == 4 =>
      if @status == 200 =>
        res @responseText
      else rej @statusText
  xhr.open \GET, option.url
  xhr.send!

render = ->
  xcode = """
  config = {
    dur: #{config.dur}s
    accelerate: #{config.accelerate}
    cycle: #{config.cycle}deg
  }

  """ + [code.basic, code.base, code.mod].join(\\n)
  console.log xcode
  stylus xcode
    .set \filename, \index.css
    .render (e,c) ->
      if !render.style =>
        render.style = document.createElement("style")
        render.style.setAttribute \type, \text/css
        document.body.appendChild render.style
      render.style.innerHTML = c

code = {}
config = {}

http url: \/basic.styl, method: \GET
  .then (basic) ->
    code.basic = basic
    http url: \/animation/spin/base.styl, method: \GET
  .then (base) ->
    code.base = base
    http url: \/animation/spin/spin.js, method: \GET
  .then (mod) ->
    code.module = mod
    module = {}
    eval(code.module)
    module = module.exports
    code.mod = module.code!
    render!

Array.from( document.querySelectorAll \input ).map (d,i) ->
  d.addEventListener \keyup, (e) ->
    name = d.getAttribute \data-config
    config[name] = d.value
    render!

/*
style = document.createElement("style")
style.setAttribute \type, \text/css
document.body.appendChild style

config = {}
basic = """
  timing-step(rate)
    animation-timing-function: cubic-bezier(rate,0,1 - rate,1)
  timing-speed-down(rate)
    animation-timing-function: cubic-bezier(0,rate,1 - rate,1)
  timing-speed-up(rate)
    animation-timing-function: cubic-bezier(rate,0,1,1 - rate)
"""
data = {}

render = ->
  console.log config
  code = """
  config = {
    dur: #{config.dur}s
    accelerate: #{config.accelerate}
    cycle: #{config.cycle}deg
  }
  """ + data.code
  console.log code
  stylus code
    .set \filename, \index.css
    .render (e,c) ->
      style.innerHTML = c

xhr1 = new XMLHttpRequest!
xhr1.onreadystatechange = ->
  if @readyState == 4 and @status == 200 =>
    base = @responseText
    xhr = new XMLHttpRequest!
    xhr.onreadystatechange = ->
      if @readyState == 4 and @status == 200 =>
        module = {}
        eval(@responseText)
        module = module.exports
        code = module.code!

        data.code = [basic, base, code].join(\\n)

    xhr.open \GET, \/animation/spin/spin.js
    xhr.send!

xhr1.open \GET, \/animation/spin/base.styl
xhr1.send!

Array.from( document.querySelectorAll \input ).map (d,i) ->
  d.addEventListener \keyup, (e) ->
    name = d.getAttribute \data-config
    config[name] = d.value
    render!


*/
