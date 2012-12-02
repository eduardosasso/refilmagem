// Generated by CoffeeScript 1.3.3
(function() {
  var GoogleMovies, MovieParser,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  MovieParser = require('./movie_parser');

  GoogleMovies = (function(_super) {

    __extends(GoogleMovies, _super);

    function GoogleMovies() {
      this.addMovie = __bind(this.addMovie, this);
      return GoogleMovies.__super__.constructor.apply(this, arguments);
    }

    GoogleMovies.SUBTITLE_REGEX = /s*-* (legendado|dublado)*$/i;

    GoogleMovies.prototype.parse = function($) {
      var that;
      that = this;
      return $(".showtimes .movie").each(function() {
        var name, showtimes, subtitle;
        name = $('.name', this).text();
        showtimes = $.map($('.times', this).text().split('&nbsp'), function(val) {
          return val.replace(/[^a-zA-Z0-9:\-]/g, '');
        });
        subtitle = that.subtitle(name);
        name = that.normalize(name);
        return that.addMovie(name, showtimes, subtitle);
      });
    };

    GoogleMovies.prototype.subtitle = function(movie_name) {
      var match;
      match = GoogleMovies.SUBTITLE_REGEX.exec(movie_name);
      if (match) {
        return match[1].toLowerCase();
      }
    };

    GoogleMovies.prototype.normalize = function(movie_name) {
      return movie_name.replace(GoogleMovies.SUBTITLE_REGEX, "").trim();
    };

    GoogleMovies.prototype.addMovie = function() {
      return GoogleMovies.__super__.addMovie.apply(this, arguments);
    };

    GoogleMovies.example_url = function() {
      return "http://www.google.com.br/movies?near=porto+alegre&tid=1f76f971434a044";
    };

    return GoogleMovies;

  })(MovieParser);

  module.exports = GoogleMovies;

}).call(this);
