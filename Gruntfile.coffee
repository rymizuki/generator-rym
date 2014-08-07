"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-simple-mocha"

  grunt.registerTask "grunt-plugin", [
    "coffeelint:grunt-plugin"
    "coffee:grunt-plugin"
  ]
  grunt.registerTask "test", [
    "coffeelint:test"
    "simplemocha"
  ]

  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    watch:
      options: {}
      'grunt-plugin':
        files: [
          "src/grunt-plugin.coffee"
          "src/grunt-plugin/*.coffee"
          "src/grunt-plugin/**/*.coffee"
        ]
        tasks: [ "grunt-plugin" ]
      test:
        files: [
          "test/*.coffee"
          "test/**/*.coffee"
          "!temp/"
        ]
        tasks: [ "test" ]

    coffeelint:
      'grunt-plugin': "<%= watch['grunt-plugin'].files %>"
      'test': "<%= watch.test.files %>"

    coffee:
      'grunt-plugin':
        files:
          "grunt-plugin/index.js": [
            "src/grunt-plugin.coffee"
            "src/grunt-plugin/**/*.coffee"
          ]

    simplemocha:
      options:
        reporter: "nyan"
        ui: "bdd"
      test:
        src: ["test/**/*.coffee"]
