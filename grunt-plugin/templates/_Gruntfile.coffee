"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "build", [
    "clean:plugin"
    "coffeelint:plugin"
    "coffee:plugin"
  ]
  grunt.registerTask "test", [
  ]

  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    watch:
      plugin:
        files: [
          "src/tasks/*.coffee"
          "src/tasks/**/*.coffee"
        ]
        tasks: ["build"]

    clean:
      plugin: "tasks/<%= name %>.js"

    coffeelint:
      plugin: [
        "src/tasks/*.coffee"
        "src/tasks/**/*.coffee"
      ]

    coffee:
      plugin:
        files: [
          "tasks/<%= name %>.js": [
            "src/tasks/*.coffee"
            "src/tasks/**/*.coffee"
          ]
        ]
