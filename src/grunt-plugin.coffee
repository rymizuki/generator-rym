"use strict"

path   = require "path"
yeoman = require "yeoman-generator"
yosay  = require "yosay"
chalk  = require "chalk"
moment = require "moment"

class RymGenerator extends yeoman.generators.Base
  init: ->
    @pkg = require "../package.json"
    @on "end", ->
      @installDependencies() unless @options["skip-install"]
  askFor: ->
    done = @async()
    # Have yeoman greet user.
    @log yosay "Welcom to the marvelous GruntPlugin generator!"
    @prompt [
      {
        type: "input"
        name: "name"
        message: "enter the base name"
        default: @appname
      }
      {
        type: "input"
        name: "description"
        message: "enter the description"
        default: ""
      }
      {
        type: "input"
        name: "version"
        message: "enter the version"
        default: "0.0.0"
      }
      {
        type: "input"
        name: "initial_released_on"
        message: "enter the date for released this plugin"
        default: moment().format "YYYY-MM-DD"
      }
    ], (props) =>
      @name        = props.name
      @description = props.description
      @version     = props.version
      @today       = props.initial_released_on
      done()
  'grunt-plugin': ->
    @template "_README.md", "README.md"
    @template "_package.json", "package.json"
    @template "_Gruntfile.coffee", "Gruntfile.coffee"

    @mkdir "src"
    @mkdir "src/tasks"
    @template "src/tasks/_plugin.coffee", "src/tasks/#{ @name }.coffee"

  projectfiles: ->
    @copy "editorconfig", ".editorconfig"

module.exports = RymGenerator
