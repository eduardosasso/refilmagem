request = require('supertest')
app = require process.cwd() + '/app.coffee'

describe "GET /cinemas", ->
  beforeEach (done) ->
    replay.mode = "record"
    @req = request(app).get("/api/cinemas")
    done()

  it 'returns 200 status', (done) ->
    @req.expect(200, done())

  it 'has JSON content type', (done) ->
    @req.expect("Content-Type", /json/)
    done()