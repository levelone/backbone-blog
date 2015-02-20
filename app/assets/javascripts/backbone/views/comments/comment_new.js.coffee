class BackboneBlog.Views.CommentNew extends Backbone.View

  initialize: (options) ->
    @comments = options.comments
    @comment  = options.comment
    @router   = options.router

    @comments.on 'add', @addCommentRecord, this if @comments != undefined

  createComment: ->
    @comment.set
      content: $('#new_comment_content').val()
      post_id: $('#new_comment_post_id').val()

    @comment.save
    @comments.create(@comment, wait: true) if @comments != undefined

    @router.navigate "#posts/#{@comment.get('post_id')}", trigger: true

  addCommentRecord: (comment) ->
    @router.navigate "#posts/#{comment.get('post_id')}", trigger: true
