window.BackboneBlog =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new BackboneBlog.Routers.Posts()
    Backbone.history.start()

$(document).ready ->
  BackboneBlog.initialize()
