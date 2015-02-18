class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']
  events:
    'submit #new_comment' : 'newComment'
    'click #edit_post'    : 'editPost'
    # 'click .destroy_comment' : 'destroyComment'

  initialize: (options) ->
    # @posts        = options.collection
    @post         = options.model
    @router       = options.router
    @attachments  = options.attachments
    @comments     = options.comments

    @comments.bind 'refresh', this 
    # @comments.on 'read', @reloadTable, this
    @comments.on 'add', @appendComment, this
    # @commentCollection = new BackboneBlog.Collections.Comments({model: BackboneBlog.Models.Post})

  render: ->
    # @$el.html @template(post: @post)
    @$el.html @template
      post: @post
      attachments: @attachments
      comments: @comments

    # @post.fetch         add: true, sync: true
    # @attachments.fetch  add: true, sync: true if @attachments != undefined
    @comments.fetch     add: true, sync: true if @comments != undefined
    @

  appendComment: (comment) ->
    if comment.get('post_id') == @post.get('id')
      view = new BackboneBlog.Views.Comment
        model: comment

      @$('#list-of-comments').append view.render().el

  # Event Listeners
  newComment: (e) ->
    e.preventDefault()

    view = new BackboneBlog.Views.CommentNew
      collection: @comments
      comment: new BackboneBlog.Models.Comment()
      router: @router

    $('.comments-container').html view.createComment()

  editPost: (e) ->
    e.preventDefault()

    view = new BackboneBlog.Views.PostEdit
      model: @post
      router: @router

    @$('#posts').append view.render().el

    @router.navigate "#posts/#{@post.get('id')}/edit", trigger: true
