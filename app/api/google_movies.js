// Generated by CoffeeScript 1.3.3
(function() {
  var GoogleMovies, Showtimes;

  Showtimes = require("./showtimes");

  GoogleMovies = (function() {

    function GoogleMovies() {}

    GoogleMovies.prototype.run = function($) {
      return $(".showtimes .movie").each(function() {
        var movie, showtimes;
        movie = $('.name', this).text();
        showtimes = $.map($('.times', this).text().split('&nbsp'), function(val) {
          return val.replace(/[^a-zA-Z0-9:\-]/g, '');
        });
        console.log(movie);
        return console.log(" -", showtimes);
      });
    };

    return GoogleMovies;

  })();

  module.exports = GoogleMovies;

  new Showtimes("http://www.google.com.br/movies?near=porto+alegre&tid=8ae8a7a6a67628ba", new GoogleMovies);

}).call(this);
