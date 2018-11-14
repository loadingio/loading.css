require! <[fs bluebird path stylus]>


render = (mod-path) -> new bluebird (res, rej) ->
  module = require mod-path
  default-configs = do
    dur: {default: 1, type: \number, unit: \s, min: 0, max: 10}
  for k,v of default-configs => module.{}edit[k] = v <<< (module.{}edit[k] or {})
  base = path.dirname mod-path
  hash = {}
  for k,v of module.edit
    hash[k] = if v.unit => "#{v.default}#{v.unit}" else v.default
  code = """
  @import 'base.styl'
  config = #{JSON.stringify(hash).replace(/"/g, '')}
  #{module.code!}
  """
  stylus code
    .set \filename, "#{base}/#{module.name}.styl"
    .import(__dirname + '/basic.styl')
    .render (err, css) -> if err => rej err else res css

recurse = (root) ->
  list = []
  files = fs.readdir-sync root .map -> "#root/#it"
  for file in files =>
    if /\.ls$/.exec(file) => list.push "./#file".replace /\.ls$/, ''
    else if fs.stat-sync file .is-directory! => list ++= recurse(file)
  return list

list = recurse \animation

bluebird.all list.map(-> render it)
  .then -> fs.write-file-sync "loading.css", it.join('')
