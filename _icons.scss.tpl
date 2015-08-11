@font-face {
  font-family: "<%= fontName %>";
  src: url('<%= fontPath %><%= fontName %>.eot');
  src: url('<%= fontPath %><%= fontName %>.eot?#iefix') format('eot'),
    url('<%= fontPath %><%= fontName %>.woff') format('woff'),
    url('<%= fontPath %><%= fontName %>.ttf') format('truetype');
}

%icon {
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

@function icon-char($filename) {
  $char: "";
<% _.each(glyphs, function(glyph) { %>
  @if $filename == <%= glyph.name %> {
    $char: "\<%= glyph.codepoint %>";
  }<% }); %>

  @return $char;
}

@mixin icon($filename, $insert: before) {
  @extend %icon;
  &:#{$insert} {
    content: icon-char($filename);
  }
}

<% _.each(glyphs, function(glyph) { %>.icon-<%= glyph.name %> {
  @include icon(<%= glyph.name %>);
}
<% }); %>
