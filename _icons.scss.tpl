@font-face {
  font-family: "<%= fontName %>";
  src: url('<%= fontPath %><%= fontName %>.eot');
  src: url('<%= fontPath %><%= fontName %>.eot?#iefix') format('eot'),
    url('<%= fontPath %><%= fontName %>.woff') format('woff'),
    url('<%= fontPath %><%= fontName %>.ttf') format('truetype');
}

.<%= prefix %>icon {
  position: relative;
  font-family: "<%= fontName %>";
  top: 1px;
  display: inline-block;
  line-height: 1;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-style: normal;
  font-variant: normal;
  font-weight: normal;
  speak: none;
  text-decoration: none;
  text-transform: none;
}

<% _.each(glyphs, function(glyph) { %>.<%= prefix %>icon-<%= glyph.name %>:before {
  content: "\<%= glyph.codepoint %>";
}
<% }); %>
