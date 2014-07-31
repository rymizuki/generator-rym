(function() {
  "use strict";
  var RymGenerator, chalk, moment, path, yeoman, yosay,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  path = require("path");

  yeoman = require("yeoman-generator");

  yosay = require("yosay");

  chalk = require("chalk");

  moment = require("moment");

  RymGenerator = (function(_super) {
    __extends(RymGenerator, _super);

    function RymGenerator() {
      return RymGenerator.__super__.constructor.apply(this, arguments);
    }

    RymGenerator.prototype.init = function() {
      this.pkg = require("../package.json");
      return this.on("end", function() {
        if (!this.options["skip-install"]) {
          return this.installDependencies();
        }
      });
    };

    RymGenerator.prototype.askFor = function() {
      var done;
      done = this.async();
      this.log(yosay("Welcom to the marvelous GruntPlugin generator!"));
      return this.prompt([
        {
          type: "input",
          name: "name",
          message: "enter the base name",
          "default": this.appname
        }, {
          type: "input",
          name: "description",
          message: "enter the description",
          "default": ""
        }, {
          type: "input",
          name: "version",
          message: "enter the version",
          "default": "0.0.0"
        }, {
          type: "input",
          name: "initial_released_on",
          message: "enter the date for released this plugin",
          "default": moment().format("YYYY-MM-DD")
        }
      ], (function(_this) {
        return function(props) {
          _this.name = props.name;
          _this.description = props.description;
          _this.version = props.version;
          _this.today = props.initial_released_on;
          return done();
        };
      })(this));
    };

    RymGenerator.prototype['grunt-plugin'] = function() {
      this.template("_README.md", "README.md");
      this.template("_package.json", "package.json");
      this.template("_Gruntfile.coffee", "Gruntfile.coffee");
      this.mkdir("src");
      this.mkdir("src/tasks");
      return this.template("src/tasks/_plugin.coffee", "src/tasks/" + this.name + ".coffee");
    };

    RymGenerator.prototype.projectfiles = function() {
      return this.copy("editorconfig", ".editorconfig");
    };

    return RymGenerator;

  })(yeoman.generators.Base);

  module.exports = RymGenerator;

}).call(this);
