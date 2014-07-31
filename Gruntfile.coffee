"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-coffeelint"

  grunt.registerTask "grunt-plugin", [
    "coffeelint:grunt-plugin"
    "coffee:grunt-plugin"
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

    coffeelint:
      'grunt-plugin': "<%= watch['grunt-plugin'].files %>"

    coffee:
      'grunt-plugin':
        files:
          "grunt-plugin/index.js": [
            "src/grunt-plugin.coffee"
            "src/grunt-plugin/**/*.coffee"
          ]
