class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']
  events:
    'submit #new_comment'     : 'newComment'
    # 'submit #new_attachment'  : 'newAttachment'
    # 'click .destroy_comment' : 'destroyComment'

  initialize: (options) ->
    @collection   = options.collection
    @post         = options.model
    @router       = options.router
    @el           = options.el
    @comments     = options.comments
    @attachments  = options.attachments

    @comments.bind('refresh', this)
    # @comments.on 'read', @reloadTable, this
    @comments.on 'add', @appendComment, this
    # @commentCollection = new BackboneBlog.Collections.Comments({model: BackboneBlog.Models.Post})

  render: ->
    $(@el).html @template(post: @post, attachments: @attachments)
    @attachments.fetch
      add: true
      sync: true
    @post.fetch
      add: true
      sync: true
    @comments.fetch
      add: true
      sync: true
    @

  newComment: (e) ->
    e.preventDefault()

    view = new BackboneBlog.Views.CommentNew
      collection: @comments
      comment: new BackboneBlog.Models.Comment()
      router: @router

    $('.comments-container').html view.createComment().el
    # @router.navigate("#posts/#{@post.id}")

  appendComment: (comment) ->
    if comment.get('post_id') == @post.get('id')
      view = new BackboneBlog.Views.Comment
        model: comment

      @$('#list-of-comments').append(view.render().el)

  # appendAttachment: (attachment) ->
  #   if attachment.get('post_id') == @post.get('id')
  #     view = new BackboneBlog.Views.Attachment
  #       model: attachment
  #
  #     @$('#list-of-comments').append(view.render().el)
