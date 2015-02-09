class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']

  initialize: (options) ->
    postId = options.postId
    @post = new BackboneBlog.Models.Post(id: postId)

  render: ->
    @post.fetch
      success: (resp) =>
        @renderTemplate()
    this

  renderTemplate: ->
    $(@el).html(@template(post: @post))
    this
