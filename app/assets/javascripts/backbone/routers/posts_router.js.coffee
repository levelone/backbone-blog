class BackboneBlog.Routers.Posts extends Backbone.Router
  routes:
    ''                : 'index'
    'posts/:page'     : 'index'
    'posts/new'       : 'create'
    'posts/:id/edit'  : 'edit'
    'posts/:id'       : 'show'

  initialize: ->
    @collection = new BackboneBlog.Collections.Posts()

  index: (page = 1) ->
    # $('#container').html JST['helpers/loading']
    currentView = new BackboneBlog.Views.PostsIndex(collection: @collection, pages: page)
    # x = currentView.collection
    #.fetch(data {page: page})
    $('#container').html currentView.render().el

  create: ->
    currentView = new BackboneBlog.Views.PostNew(collection: @collection, post: new BackboneBlog.Models.Post(), router: this)
    $('#container').html currentView.render().el

  edit: (id) ->
    currentView = new BackboneBlog.Views.PostEdit(postId: id, router: this)
    $('#container').html currentView.render().el

  show: (id) ->
    currentView = new BackboneBlog.Views.PostShow(postId: id, router: this)
    $('#container').html(currentView.render().el)
