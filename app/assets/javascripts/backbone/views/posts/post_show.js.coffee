class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']

  initialize: (options) ->
    # document.title = "#{document.title} | Show"
    @post = options.post

  render: ->
    $(@el).html(@template(post: @post))
    # @setElement.html(@template(post: @post))
    this


# class BackboneBlog.Views.PostShow extends Backbone.View
#   template: JST['posts/show']
#   tagName: 'div'
#   events: {
#     'click #posts': 'showAllPosts'
#   }
#
#   render: ->
#     $(@el).html(@template(post: @model))
#     this
#
#   showAllPosts: ->
#     view_all = new BackboneBlog.Views.PostsIndex(collection: @model)
#     $('.post-container').remove()
#
#     $('#container').html(view_all.render().el)
