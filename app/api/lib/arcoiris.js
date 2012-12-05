// Generated by CoffeeScript 1.3.3
(function() {
  var Arcoiris, MovieParser, moment, _,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  MovieParser = require('./movie_parser');

  moment = require('moment');

  _ = require('underscore');

  Arcoiris = (function(_super) {

    __extends(Arcoiris, _super);

    function Arcoiris() {
      this.addMovie = __bind(this.addMovie, this);
      return Arcoiris.__super__.constructor.apply(this, arguments);
    }

    Arcoiris.prototype.parse = function($) {
      var id_cinema, that, today;
      that = this;
      id_cinema = "#1012";
      today = moment().format('DD/MM');
      return $("ul" + id_cinema + " > li").each(function() {
        var movie, movie_name, showtimes, showtimes_raw, showtimes_today;
        movie = $('a', this);
        movie_name = movie.text();
        showtimes_raw = $("h3:contains('" + today + "')", movie.next());
        showtimes_today = $('span', showtimes_raw.parent());
        if (showtimes_today.length === 0) {
          return true;
        }
        showtimes = _.compact($.map(showtimes_today.text().split('|'), function(val) {
          return val.replace(/[^a-zA-Z0-9:\-]/g, '');
        }));
        return that.addMovie(movie_name, showtimes);
      });
    };

    Arcoiris.prototype.addMovie = function() {
      return Arcoiris.__super__.addMovie.apply(this, arguments);
    };

    Arcoiris.example_url = function() {
      return "http://www.arcoiriscinemas.com.br/index.php?DataObject_Controller/load/programacao_cidades/71986";
    };

    return Arcoiris;

  })(MovieParser);

  module.exports = Arcoiris;

}).call(this);
