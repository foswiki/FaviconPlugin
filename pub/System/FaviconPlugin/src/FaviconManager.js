/*
 * Favicon Manager 1.0
 *
 * Copyright (c) 2021-2024 Michael Daum http://michaeldaumconsulting.com
 *
 * Licensed under the GPL licenses http://www.gnu.org/licenses/gpl.html
 *
 */
/* global Favico:false */
"use strict";
(function($) {
  var defaults = {
    bgColor : '#d00',
    textColor : '#fff',
    type: 'circle',
    position: 'down',
    animation:'slide', 
    fontFamily : 'sans-serif',
    fontStyle : 'bold',
  };

  function FaviconManager(opts) {
    var self = this;

    self.opts = $.extend({}, defaults, opts);
  }

  FaviconManager.prototype.setText = function(text, opts) {
    var self = this;
    return new Favico($.extend({}, self.opts, opts)).badge(text);
  };

  FaviconManager.prototype.setImage = function(param) {
    var self = this;
    return new Favico().image(img);
  };

  FaviconManager.prototype.config = function(opts) {
    var self = this;

    self.opts = $.extend({}, self.opts, opts);
  };

  foswiki.faviconManager = new FaviconManager();

  $(function() {
    $(".jqFavicon").livequery(function() {
      var $this = $(this), 
          opts = $this.data();

      if (typeof(opts.text) !== 'undefined') {
        foswiki.faviconManager.setText(opts.text, opts);
        return;
      }

      if (typeof(opts.image) !== 'undefined') {
        var $img = $(opts.image)

        if ($img.length) {
          foswiki.faviconManager.setImage($img[0], opts);
        }

        return;
      }

      if ($this.is("img")) {
        foswiki.faviconManager.setImage($this[0], opts);
        return;
      }

      // fallback
      foswiki.faviconManager.setText($this.text(), opts);
    });
  });

})(jQuery);
