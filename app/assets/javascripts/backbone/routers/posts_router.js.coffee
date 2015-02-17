class BackboneBlog.Routers.Posts extends Backbone.Router
  routes:
    ''                : 'index'
    'posts/new'       : 'create'
    'posts/:id/edit'  : 'edit'
    'posts/:id'       : 'show'

  initialize: ->
    @posts    = new BackboneBlog.Collections.Posts()
    @comments = new BackboneBlog.Collections.Comments()

  index: ->
    @postsIndexView = new BackboneBlog.Views.PostsIndex
      el: $('#container')
      collection: @posts
      router: @
    @postsIndexView.render()

  create: ->
    currentView = new BackboneBlog.Views.PostNew(collection: @posts, post: new BackboneBlog.Models.Post(), router: this)
    $('#container').html currentView.render().el

  edit: (id) ->
    @post = @posts.get id
    @postsEditView = new BackboneBlog.Views.PostEdit
      el: $('#container')
      model: @post
      collection: @posts
      router: @
    @postsEditView.render()

    # currentView = new BackboneBlog.Views.PostEdit(model: @model, router: this)
    # $('#container').html currentView.render().el

  show: (id) ->
    @post = @posts.get id
    @postsShowView = new BackboneBlog.Views.PostShow
      el: $('#container')
      model: @post
      collection: @posts
      comments: @comments
      router: @
    @postsShowView.render()

    # @model = @posts.get(id)
    # console.log id
    # console.log this
    #
    # currentView = new BackboneBlog.Views.PostShow(model: @model, router: this)
    # $('#container').html(currentView.render().el)
