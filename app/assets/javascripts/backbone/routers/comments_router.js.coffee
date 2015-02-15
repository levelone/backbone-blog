class BackboneBlog.Routers.Comments extends Backbone.Router
  routes:
    'comments' : 'index'
    # 'posts/:id/edit'  : 'edit'
    # 'posts/:id'       : 'show'

  initialize: ->
    @collection = new BackboneBlog.Collections.Comments()

  index: ->
    console.log 'index router method'
    # currentView = new BackboneBlog.Views.PostsIndex(collection: @collection)
    # $('#container').html currentView.render().el

  # create: ->
  #   currentView = new BackboneBlog.Views.PostNew(collection: @collection, post: new BackboneBlog.Models.Post(), router: this)
  #   $('#container').html currentView.render().el
  #
  # edit: (id) ->
  #   @model = @collection.get(id)
  #
  #   currentView = new BackboneBlog.Views.PostEdit(model: @model, router: this)
  #   $('#container').html currentView.render().el
  #
  # show: (id) ->
  #   @model = @collection.get(id)
  #   console.log id
  #   console.log this
  #
  #   currentView = new BackboneBlog.Views.PostShow(model: @model, router: this)
  #   $('#container').html(currentView.render().el)
