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
    $('#container').html currentView.render().el

  create: ->
    currentView = new BackboneBlog.Views.PostNew(collection: @collection, post: new BackboneBlog.Models.Post(), router: this)
    $('#container').html currentView.render().el

  edit: (id) ->
    @model = @collection.get(id)

    currentView = new BackboneBlog.Views.PostEdit(model: @model, router: this)
    $('#container').html currentView.render().el

  show: (id) ->
    @model = @collection.get(id)
    console.log id
    console.log this

    currentView = new BackboneBlog.Views.PostShow(model: @model, router: this)
    $('#container').html(currentView.render().el)
