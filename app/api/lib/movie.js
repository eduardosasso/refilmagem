// Generated by CoffeeScript 1.3.3
(function() {
  var Movie, _;

  _ = require('underscore');

  Movie = (function() {
    var clean_regex;

    clean_regex = [/\s*[-|\/]*\s*(LEG|DUB)\s*[.]?$/i, /\s*-*\s*(legendado|dublado)\s*$/i];

    function Movie(name, showtimes, subtitle, _3d) {
      if (showtimes == null) {
        showtimes = [];
      }
      if (subtitle == null) {
        subtitle = null;
      }
      if (_3d == null) {
        _3d = false;
      }
      this.setName(name);
      this.setSubtitle(subtitle || name);
      this.setShowtimes(showtimes);
    }

    Movie.prototype.setName = function(name) {
      this.name = this._sanitize(name);
      return this.name_raw = name;
    };

    Movie.prototype.setSubtitle = function(subtitle) {
      return this.subtitle = this._extractSubtitle(subtitle);
    };

    Movie.prototype.setShowtimes = function(showtimes) {
      return this.showtimes = showtimes;
    };

    Movie.prototype.setShowtime = function(showtime) {
      return this.showtimes.push(showtime);
    };

    Movie.prototype._extractSubtitle = function(name) {
      var subtitle;
      subtitle = 'legendado';
      _.each(clean_regex, function(regex) {
        var match;
        match = regex.exec(name);
        if (match && /dub/i.test(match[1])) {
          return subtitle = 'dublado';
        }
      });
      return subtitle;
    };

    Movie.prototype._sanitize = function(name) {
      _.each(clean_regex, function(expression) {
        return name = name.replace(expression, "").trim();
      });
      return name;
    };

    return Movie;

  })();

  module.exports = Movie;

}).call(this);
