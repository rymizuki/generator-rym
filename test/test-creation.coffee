# global describe, beforeEach it
"use strict"

path    = require "path"
helpers = require("yeoman-generator").test

describe "rym generator", ->
  beforeEach (done) ->
    helpers.testDirectory(path.join(__dirname, "temp"), (err) =>
      return done(err) if err
      @app = helpers.createGenerator "rym:grunt-plugin", [
        "../../grunt-plugin"
      ]
      done()
    )

  describe "creates expected files", ->
    expected = null

    beforeEach ->
      expected = [
        ".editorconfig"
        "README.md"
        "package.json"
        "Gruntfile.coffee"
        "src/tasks/test-plugin.coffee"
      ]
      helpers.mockPrompt @app, {
        name:        "test-plugin"
        description: "this is test plugin"
        version:     "0.0.0"
      }
      @app.options["skip-install"] = true

    it "should be exists expected files ", (done) ->
      @app.run {}, ->
        helpers.assertFile(expected)
        done()
