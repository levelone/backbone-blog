class BackboneBlog.Routers.Posts extends Backbone.Router
  routes:
    '': 'index'
    'posts/:id': 'show'

  initialize: ->
    console.log '1'
    @collection = new BackboneBlog.Collections.Posts()
    # window.test = @collection
    # @collection.fetch()

  index: ->
    console.log '2'
    view = new BackboneBlog.Views.PostsIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "show post #{id}"
