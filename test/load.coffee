# global describe, beforeEach, it
"use strict"

expect = require "expect.js"

describe "grunt-plugin generator", ->
  app = null
  beforeEach ->
    app = require "../grunt-plugin"
  it "can be imported without blowing up", ->
    expect(app).to.be.ok()
