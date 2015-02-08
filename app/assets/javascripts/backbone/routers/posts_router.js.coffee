class BackboneBlog.Routers.Posts extends Backbone.Router
  routes:
    ''                : 'index'
    'posts/new'       : 'create'
    'posts/:id/edit'  : 'edit'
    'posts/:id'       : 'show'

  initialize: ->
    @collection = new BackboneBlog.Collections.Posts()

  index: ->
    currentView = new BackboneBlog.Views.PostsIndex(collection: @collection)
    $('#container').html(currentView.render().el)

  create: ->
    currentView = new BackboneBlog.Views.PostNew(collection: @collection, post: new BackboneBlog.Models.Post())
    $('#container').html(currentView.render().el)

  edit: (id) ->
    console.log 'edit'
    # post = @collection.get(id)
    # currentView = new BackboneBlog.Views.PostEdit(post: post)
    # $('#container').html(currentView.render().el)

  show: (id) ->
    currentView = new BackboneBlog.Views.PostShow(post: @collection.get(id))
    $('#container').html(currentView.render().el)
