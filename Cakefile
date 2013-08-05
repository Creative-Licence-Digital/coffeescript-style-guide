{spawn, exec} = require 'child_process'
fs = require 'fs'

task "readme", "rebuild the readme file", ->
   source = fs.readFileSync('style.litcoffee').toString()
   source = source.replace /\n\n    ([\s\S]*?)\n\n(?!    )/mg, (match, code) ->
     "\n```coffeescript\n#{code.replace(/^    /mg, '')}\n```\n"
   fs.writeFileSync 'README.md', source
