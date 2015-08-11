'use strict';

var fs = require('fs');
var path = require('path');
var _ = require('lodash');

function gulpWebFont(options) {
  if (!options.fontPath) {
    throw "fontPath must be specified!";
  }
  return function (glyphs, iconOptions) {
    var config = _.extend({
      templateFile: path.join(path.dirname(module.filename), '_icons.scss.tpl'),
      fontPath: options.fontPath,
      fontName: iconOptions.fontName,
      prefix: ''
    }, options);
    var template = fs.readFileSync(config.templateFile);
    // build code points
    _.each(glyphs, function (glyph) {
      glyph.codepoint = glyph.unicode[0].charCodeAt(0).toString(16).toUpperCase();
    });
    var content = _.template(template)({
      glyphs: glyphs,
      fontName: config.fontName,
      fontPath: config.fontPath.replace(/\/?$/, '/'),
      prefix: config.prefix
    });
    fs.writeFileSync(config.outFile, content);
  };
}

module.exports = gulpWebFont;
