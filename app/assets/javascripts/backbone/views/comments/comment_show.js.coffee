class BackboneBlog.Views.CommentShow extends Backbone.View
  template: JST['comment/show']

  initialize: (options) ->
    @comment  = options.comment
    @router   = options.router

  render: ->
    @createComment
    @router.navigate "#posts/#{@comment.get('post_id')}", trigger: true
