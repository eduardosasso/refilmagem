http = require('http')
app = require './app.coffee'

http.createServer(app).listen app.get('port'), ()->
  console.log("Express server listening on port " + app.get('port'))
