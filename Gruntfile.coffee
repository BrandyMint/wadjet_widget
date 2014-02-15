"use strict"
LIVERELOAD_PORT = 35729
SERVER_PORT = 3006
lrSnippet = require("connect-livereload")(port: LIVERELOAD_PORT)
mountFolder = (connect, dir) ->
  connect.static require("path").resolve(dir)


# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to match all subfolders:
# 'test/spec/**/*.js'
# templateFramework: 'lodash'
module.exports = (grunt) ->

  # show elapsed time at the end
  require("time-grunt") grunt

  # load all grunt tasks
  require("load-grunt-tasks") grunt
  grunt.loadNpmTasks "grunt-haml"
  grunt.loadNpmTasks "grunt-autoprefixer"

  # configurable paths
  yeomanConfig =
    app: "app"
    dist: "dist"

  grunt.initConfig
    autoprefixer:
      options:
        browsers: ['last 2 version']
        map: true
      dist:
        src: ".tmp/styles/widget.css"

    yeoman: yeomanConfig
    watch:
      options:
        nospawn: true
        livereload: true

      coffee:
        files: ["<%= yeoman.app %>/scripts/{,*/}*.coffee"]
        tasks: ["coffee:dist"]

      coffeeTest:
        files: ["test/spec/{,*/}*.coffee"]
        tasks: ["coffee:test"]

      haml:
        files: ["<%= yeoman.app %>/scripts/templates/{,*/}*.haml"]
        tasks: ["haml"]

      compass:
        files: ["<%= yeoman.app %>/styles/{,*/}*.{scss,sass}"]
        tasks: ["compass", "autoprefixer"]

      livereload:
        options:
          livereload: LIVERELOAD_PORT

        files: [
          "<%= yeoman.app %>/*.html"
          "{.tmp,<%= yeoman.app %>}/styles/{,*/}*.css"
          "{.tmp,<%= yeoman.app %>}/scripts/{,*/}*.js"
          "<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp}"
          "<%= yeoman.app %>/scripts/templates/{,*/}*.{ejs,mustache,hbs,haml}"
          "test/spec/**/*.js"
        ]

      jst:
        files: ["<%= yeoman.app %>/scripts/templates/*.ejs"]
        tasks: ["jst"]

      test:
        files: [
          "<%= yeoman.app %>/scripts/{,*/}*.js"
          "test/spec/**/*.js"
        ]
        tasks: ["test"]

    connect:
      options:
        port: SERVER_PORT
        
        # change this to '0.0.0.0' to access the server from outside
        hostname: "localhost"

      livereload:
        options:
          middleware: (connect) ->
            [
              lrSnippet
              mountFolder(connect, ".tmp")
              mountFolder(connect, yeomanConfig.app)
            ]

      test:
        options:
          port: 9001
          middleware: (connect) ->
            [
              lrSnippet
              mountFolder(connect, ".tmp")
              mountFolder(connect, "test")
              mountFolder(connect, yeomanConfig.app)
            ]

      dist:
        options:
          middleware: (connect) ->
            [mountFolder(connect, yeomanConfig.dist)]

    clean:
      dist: [
        ".tmp"
        "<%= yeoman.dist %>/*"
      ]
      server: ".tmp"

    jshint:
      options:
        jshintrc: ".jshintrc"
        reporter: require("jshint-stylish")

      all: [
        "Gruntfile.js"
        "<%= yeoman.app %>/scripts/{,*/}*.js"
        "!<%= yeoman.app %>/scripts/vendor/*"
        "test/spec/{,*/}*.js"
      ]

    mocha:
      all:
        options:
          run: true
          urls: ["http://localhost:<%= connect.test.options.port %>/index.html"]

    coffee:
      dist:
        files: [
          # rather than compiling multiple files here you should
          # require them into your main .coffee file
          expand: true
          cwd: "<%= yeoman.app %>/scripts"
          src: "{,*/}*.coffee"
          dest: ".tmp/scripts"
          ext: ".js"
        ]

      test:
        files: [
          expand: true
          cwd: "test/spec"
          src: "{,*/}*.coffee"
          dest: ".tmp/spec"
          ext: ".js"
        ]

    compass:
      options:
        sassDir: "<%= yeoman.app %>/styles"
        cssDir: ".tmp/styles"
        imagesDir: "<%= yeoman.app %>/images"
        javascriptsDir: "<%= yeoman.app %>/scripts"
        fontsDir: "<%= yeoman.app %>/styles/fonts"
        importPath: "<%= yeoman.app %>/bower_components"
        relativeAssets: true

      dist: {}
      server:
        options:
          debugInfo: true

    requirejs:
      dist:
        
        # Options: https://github.com/jrburke/r.js/blob/master/build/example.build.js
        options:
          
          # `name` and `out` is set by grunt-usemin
          baseUrl: ".tmp/scripts"
          optimize: "none"
          paths:
            templates: "../../.tmp/scripts/templates"
            views: "../../.tmp/scripts/views"
            controllers: "../../.tmp/scripts/controllers"
            jquery: "../../app/bower_components/jquery/jquery"
            underscore: "../../app/bower_components/underscore/underscore"
            backbone: "../../app/bower_components/backbone/backbone"
            marionette: "../../app/bower_components/marionette/lib/backbone.marionette"
            stickit: "../../app/bower_components/backbone.stickit/backbone.stickit"
            mousetrap: "../../app/bower_components/mousetrap/mousetrap"
            spinjs: "../../app/bower_components/spinjs/spin"

          
          # TODO: Figure out how to make sourcemaps work with grunt-usemin
          # https://github.com/yeoman/grunt-usemin/issues/30
          #generateSourceMaps: true,
          # required to support SourceMaps
          # http://requirejs.org/docs/errors.html#sourcemapcomments
          preserveLicenseComments: false
          useStrict: true
          wrap: true

    
    #uglify2: {} // https://github.com/mishoo/UglifyJS2
    useminPrepare:
      html: "<%= yeoman.app %>/index.html"
      options:
        dest: "<%= yeoman.dist %>"

    usemin:
      html: ["<%= yeoman.dist %>/{,*/}*.html"]
      css: ["<%= yeoman.dist %>/styles/{,*/}*.css"]
      options:
        dirs: ["<%= yeoman.dist %>"]

    imagemin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/images"
          src: "{,*/}*.{png,jpg,jpeg}"
          dest: "<%= yeoman.dist %>/images"
        ]

    cssmin:
      dist:
        files:
          "<%= yeoman.dist %>/styles/main.css": [
            ".tmp/styles/{,*/}*.css"
            "<%= yeoman.app %>/styles/{,*/}*.css"
          ]

    htmlmin:
      dist:
        options: {}
        
        #removeCommentsFromCDATA: true,
        #                    // https://github.com/yeoman/grunt-usemin/issues/44
        #                    //collapseWhitespace: true,
        #                    collapseBooleanAttributes: true,
        #                    removeAttributeQuotes: true,
        #                    removeRedundantAttributes: true,
        #                    useShortDoctype: true,
        #                    removeEmptyAttributes: true,
        #                    removeOptionalTags: true
        files: [
          expand: true
          cwd: "<%= yeoman.app %>"
          src: "*.html"
          dest: "<%= yeoman.dist %>"
        ]

    copy:
      dist:
        files: [
          expand: true
          dot: true
          cwd: "<%= yeoman.app %>"
          dest: "<%= yeoman.dist %>"
          src: [
            "*.{ico,txt}"
            ".htaccess"
            "images/{,*/}*.{webp,gif}"
            "styles/fonts/{,*/}*.*"
            "bower_components/sass-bootstrap/fonts/*.*"
          ]
        ]

    bower:
      all:
        rjsConfig: "<%= yeoman.app %>/scripts/v1.js"

    jst:
      options:
        amd: true

      compile:
        files:
          ".tmp/scripts/templates.js": ["<%= yeoman.app %>/scripts/templates/*.ejs"]

    haml:
      options:
        placement: "amd"
        dependencies:
          $: "jquery"
          _: "underscore"

        target: "js"
        language: "coffee"

      files:
        expand: true
        cwd: "<%= yeoman.app %>/scripts/templates"
        src: "{,*/}*.haml"
        dest: ".tmp/scripts/templates"
        ext: ".js"

    rev:
      dist:
        files:
          src: [
            "<%= yeoman.dist %>/{,*/}*.json"
            "<%= yeoman.dist %>/scripts/{,*/}*.js"
            "<%= yeoman.dist %>/styles/{,*/}*.css"
            "<%= yeoman.dist %>/images/{,*/}*.{png,jpg,jpeg,gif,webp}"
            "/styles/fonts/{,*/}*.*"
            "bower_components/sass-bootstrap/fonts/*.*"
          ]

  grunt.registerTask "createDefaultTemplate", ->
    grunt.file.write ".tmp/scripts/templates.js", "this.JST = this.JST || {};"
    return

  grunt.registerTask "server", (target) ->
    if target is "dist"
      return grunt.task.run([
        "build"
        "open"
        "connect:dist:keepalive"
      ])
    if target is "test"
      return grunt.task.run([
        "clean:server"
        "coffee"
        "createDefaultTemplate"
        "jst"
        "haml"
        "compass:server"
        "autoprefixer"
        "connect:test"
        "watch:livereload"
      ])
    grunt.task.run [
      "clean:server"
      "coffee:dist"
      "createDefaultTemplate"
      "jst"
      "haml"
      "compass:server"
      "autoprefixer"
      "connect:livereload"
      "watch"
    ]
    return

  grunt.registerTask "test", [
    "clean:server"
    "coffee"
    "createDefaultTemplate"
    "jst"
    "compass"
    "connect:test"
    "mocha"
    "watch:test"
  ]
  grunt.registerTask "build", [
    "clean:dist"
    "coffee"
    "createDefaultTemplate"
    "jst"
    "haml"
    "compass:dist"
    "useminPrepare"
    "requirejs"
    "imagemin"
    "htmlmin"
    "concat"
    "cssmin"
    "uglify"
    "copy"
    "rev"
    "usemin"
  ]
  grunt.registerTask "default", [
    "jshint"
    "test"
    "build"
  ]
  return