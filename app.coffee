express_validator = require('express-validator')
express = require('express')
routes = require('./routes')
path = require('path')
flash = require('connect-flash')

require('express-namespace')

app = express()

app.configure ()->
  app.set('port', process.env.PORT || 8080)
  app.set('views', __dirname + '/views')
  app.set('view engine', 'jade')
  app.use(express.favicon())
  app.use(express.logger('dev'))
  app.use(express.bodyParser())
  app.use(express_validator)
  app.use(express.methodOverride())
  app.use(express.cookieParser('0nl1n3'))
  app.use(express.session({ cookie: { maxAge: 60000 }}))
  app.use(flash())
  app.use(app.router)
  app.use(require('stylus').middleware(__dirname + '/public'))
  app.use(express.static(path.join(__dirname, 'public')))

app.configure 'development', ()->
  app.use(express.errorHandler())

require('./routes/general')(app)
require('./apps/admin/routes')(app)
require('./apps/api/routes')(app)
app.get('/', routes.index)

module.exports = app
