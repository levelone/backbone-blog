class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']
  # templates:
  #   show: JST['posts/show']

  initialize: (options) ->
    @post   = @model
    @router = options.router

  render: ->
    @post.fetch()
    $(@el).html(@template(post: @post))
    @
    # @setElement(@templates.show.html(post: @post))
