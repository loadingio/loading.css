require! <[fs fs-extra anikit/src/anikit.ls uglifycss]>

prefix = process.argv.2 or 'ld'
dir = process.argv.3 or 'dist'
if !(prefix and dir) =>
  console.log "usage: gifmin [prefix] [dir]"
  process.exit!

alias = do
  "rubber-h": <[rubber]>
  "wander-h": <[wander]>
  "coin-h": <[coin]>
  "shake-h": <[shake]>

custom = JSON.parse(fs.read-file-sync 'src/config.json' .toString!)
all = [".#{prefix} { transform-origin: 50% 50%; transform-box: fill-box; }"]
lite = [".#{prefix} { transform-origin: 50% 50%; transform-box: fill-box; }"]
console.log "prepare dist folder ... "
fs-extra.ensure-dir-sync "#dir/entries"

console.log "generating css files for each animation ... "

for k,v of anikit.types =>
  kit = new anikit.anikit k
  if kit.config.repeat => continue # transitional animation should not be in loading.css
  console.log " - #dir/#k.css / #k.min.css "
  cls = kit.cls(
    {unit: \%} <<< (custom[k] or {}),
    {name: k, prefix, alias: if alias[k] => ([k] ++ alias[k]) else null}
  )
  all.push cls
  if k in <[ld-flip-h ld-spin ld-cycle ld-tick ld-spin-fast ld-clock ld-rubber-h]> => lite.push cls
  css = """
  #{all.0}
  #cls
  """
  fs.write-file-sync "#dir/entries/#k.css", css

  css-min = uglifycss.processString css
  fs.write-file-sync "#dir/entries/#k.min.css", css-min

console.log "generating #dir/loading.css ..."
css = all.join(\\n)
fs.write-file-sync "#dir/loading.css", css

console.log "generating #dir/loading.min.css ..."
css-min = uglifycss.processString css
fs.write-file-sync "#dir/loading.min.css", css-min

console.log "generating #dir/lite.css ..."
css = lite.join(\\n)
fs.write-file-sync "#dir/lite.css", css

console.log "generating #dir/lite.min.css ..."
css-min = uglifycss.processString css
fs.write-file-sync "#dir/lite.min.css", css-min
