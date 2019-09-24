require! <[fs fs-extra anikit uglifycss]>

alias = do
  "rubber-h": <[rubber]>
  "wander-h": <[wander]>
  "coin-h": <[coin]>
  "shake-h": <[shake]>

all = [".ld { transform-origin: 50% 50%; transform-box: fill-box; }"]
console.log "prepare dist folder ... "
fs-extra.ensure-dir-sync \dist/entries

console.log "generating css files for each animation ... "

for k,v of anikit.types =>
  console.log " - dist/entries/#k.css / #k.min.css "
  kit = new anikit.anikit k
  cls = kit.cls {unit: \%}, {name: "ld-#k", prefix: \.ld, alias: if alias[k] => ([k] ++ alias[k]) else null }
  all.push cls
  css = """
  #{all.0}
  #cls
  """
  fs.write-file-sync "dist/entries/#k.css", css

  css-min = uglifycss.processString css
  fs.write-file-sync "dist/entries/#k.min.css", css-min

console.log "generating dist/loading.css ..."
css = all.join(\\n)
fs.write-file-sync "dist/loading.css", css

console.log "generating dist/loading.min.css ..."
css-min = uglifycss.processString css
fs.write-file-sync "dist/loading.min.css", css-min
