class BackboneBlog.Views.CommentNew extends Backbone.View

  initialize: (options) ->
    @comments = options.collection
    @comment  = options.comment
    @router   = options.router

    @comments.on 'add', @addCommentRecord, this

  createComment: ->

    @comment.set
      content: $('#new_comment_content').val()
      post_id: $('#new_comment_post_id').val()

    @comment.save
    @collection.create(@comment, wait: true)

    @router.navigate("#posts/#{@comment.get('post_id')}")

  addCommentRecord: (comment) ->
    @router.navigate "#posts/#{comment.get('post_id')}", trigger: true
