#Module dependencies.
express = require 'express'
app = module.exports = express.createServer()

#Configuration

app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session { secret: 'your secret here' }
  app.use app.router
  app.use express.static(__dirname + '/public')


app.configure 'development', ->
  app.use express.errorHandler { dumpExceptions: true, showStack: true }

app.configure 'production', ->
  app.use express.errorHandler()


#Routes

app.get '/', (req, res) ->
  res.render 'index', { title: 'Application Title' }

#Only listen on $ node app.js

if !module.parent
  app.listen 3000
  console.log "Express server listening on port %d", app.address().port
