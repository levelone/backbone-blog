window.BackboneBlog =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    window.routerPosts    = new BackboneBlog.Routers.Posts()
    window.routerComments = new BackboneBlog.Routers.Comments()

    Backbone.history.start()

$(document).ready ->
  BackboneBlog.initialize()
