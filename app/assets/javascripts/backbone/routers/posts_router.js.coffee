class BackboneBlog.Routers.Posts extends Backbone.Router
  routes:
    ''                : 'index'
    'posts/:id/edit'  : 'edit'
    'posts/:id'       : 'show'

  index: ->
    postsIndexView = new BackboneBlog.Views.PostsIndex router: @
    $("#container").html postsIndexView.render().el

  show: (id) ->
    postsShowView = new BackboneBlog.Views.PostShow router: @, id: id
    $("#container").html postsShowView.el
    postsShowView.fetch()

  edit: (id) ->
    postsEditView = new BackboneBlog.Views.PostEdit router: @, id: id
    $("#container").html postsEditView.el
    postsEditView.fetch()


