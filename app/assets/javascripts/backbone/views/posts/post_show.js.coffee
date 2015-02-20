class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']
  events:
    'submit #new_comment' : 'newComment'
    'click #edit_post'    : 'editPost'
    'click #view_posts'   : 'viewPosts'

  initialize: (options) ->
    # Instantiate Collections/Models
    @post         = new BackboneBlog.Models.Post({id: options.id})
    @attachments  = new BackboneBlog.Collections.Attachments({post_id: options.id})
    @comments     = new BackboneBlog.Collections.Comments({post_id: options.id})
    @router       = options.router

    # Event Listeners
    @post.on        'change', @render, this
    @comments.bind  'refresh', this
    @comments.on    'add', @appendComment, this
    @comments.on    'change', @appendComment, this

  fetch: ->
    @post.fetch         silent: false
    @comments.fetch     add: true, data: {post_id: @post.id}
    @attachments.fetch  add: true, data: {post_id: @post.id}

  render: ->
    @$el.html @template {post: @post}
    @

  appendComment: (comment) ->
    commentView = new BackboneBlog.Views.Comment(model: comment)
    @$('#list-of-comments').append commentView.el
    commentView.render()

  newComment: (e) ->
    e.preventDefault()
    view = new BackboneBlog.Views.CommentNew
      comments: @comments
      comment: new BackboneBlog.Models.Comment()
      router: @router

    $('.comments-container').html view.createComment()

  editPost: (e) ->
    e.preventDefault()
    @router.navigate "#posts/#{@post.id}/edit", trigger: true

  viewPosts: (e) ->
    e.preventDefault()
    @router.navigate "#", trigger: true
