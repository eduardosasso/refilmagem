# Refilmagem

### Run
nodemon server.js

### Test showtimes
cd refilmagem/app/api
coffee apps/showtimes/print_showtimes google_movies

### Specs
* mocha -t 5000
* mocha -w -t 5000

* https://github.com/assaf/node-replay
- record new tests vcr like
* REPLAY=record mocha -t 5000

- all requests go out and none gets replayed
* REPLAY=bloody mocha -t 5000

### Node console
	cd refilmagem/app/api
	node
	g = require("./lib/google_movies");
	url = "http://www.google.com.br/movies?near=porto+alegre&tid=1f76f971434a044"
	google_movies = new g(url, function(movies){
		console.log(movies);
	});

	google = require("./lib/google_movies");
	google.example();