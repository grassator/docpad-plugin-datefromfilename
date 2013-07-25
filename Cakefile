{exec} = require 'child_process'
 
task 'compile', 'Compiles coffee in src/ to js in out/', ->
  compile()
 
compile = (callback) ->
  exec 'coffee -o out/ -c src/', (err, stdout, stderr) ->
    throw err if err
    console.log "Compiled coffee files"
    callback?()