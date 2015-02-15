class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']
  events:
    'submit #new_comment' : 'createComment'

  initialize: (options) ->
    @post   = @model
    @router = options.router

  render: ->
    @post.fetch()
    $(@el).html(@template(post: @post))
    @

  createComment: (e) ->
    e.preventDefault()

    @comments = new BackboneBlog.Routers.Comments()

    attributes =
      content: $('#new_comment_content').val()

    console.log attributes
    console.log e
    console.log 'go to comments collection and create comment model..'
    debugger
