class BackboneBlog.Views.CommentNew extends Backbone.View

  initialize: (options) ->
    @comments = options.collection
    @comment  = options.comment
    @router   = options.router

    # @comments.on 'add', @addCommentRecord, this

  createComment: ->
    attributes =
      content: $('#new_comment_content').val()
      post_id: $('#new_comment_post_id').val()

    debugger
    @comment.save attributes
    # @collection.create(@comment.attributes, wait: true)
    debugger
    @router.navigate("#posts/#{@comment.get('post_id')}")

  addCommentRecord: (comment) ->
    @router.navigate "#posts/#{comment.post_id}", trigger: true
