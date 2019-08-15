require! <[fs fs-extra anikit]>
output = []
output.push """
  .ld { transform-origin: 50% 50%; transform-box: fill-box; }
"""
for k,v of anikit.types => 
  {mod,config} = anikit.get k
  config <<< {name: "ld-#{config.name}"}
  if config.repeat => continue
  mod = require "../node_modules/anikit/src/kits/#{mod.name}"
  if !mod.css => continue
  css = mod.css config
  if mod.js and config.repeat =>
    js = mod.js 0, config
    init-values = (["animation-fill-mode: forwards"] ++ ["#name: #value" for name,value of js]).join(\;)
  else init-values = "";

  output.push css
  output.push """
    .ld.#{config.name} {
      animation: #{config.name} #{config.dur or 1}s #{config.repeat or \infinite}; #init-values
    }
  """

console.log output.join(\\n)
