Build _icons.scss from gulp-iconfont's "glyphs" event

Usage
========

    gulp.src('icons/**/*.svg')
      .pipe(plugins.plumber())
      .pipe(plugins.iconFont({
        fontName: fontName,
        appendUnicode: true
      }))
      .on('glyphs', plugins.iconFontScss({
        fontPath: '../fonts',
        outFile: '../styles/_icons.scss'
      }))
      .pipe(gulp.dest('../fonts'));

