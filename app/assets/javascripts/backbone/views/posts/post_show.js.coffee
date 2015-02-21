class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']
  events:
    # Post
    'submit #new_comment'             : 'newComment'
    'click #edit_post'                : 'editPost'
    'click #view_posts'               : 'viewPosts'
    # Comments
    'click a#previous_comments_page'  : 'previous'
    'click a#next_comments_page'      : 'next'

  initialize: (options) ->
    # Instantiate Collections/Models
    @post         = new BackboneBlog.Models.Post({id: options.id})
    @attachments  = new BackboneBlog.Collections.Attachments({post_id: options.id})
    @comments     = new BackboneBlog.Collections.Comments({post_id: options.id})
    @router       = options.router

    # Event Listeners
    _.bindAll       this, 'previous', 'next', 'fetch'
    @post.on        'change', @render, this
    # @comments.bind  'refresh', this
    @comments.on    'add', @appendComment, this
    @comments.on    'change', @appendComment, this

  fetch: ->
    @$('#list-of-comments').html ''
    @post.fetch
      silent: false
      wait: true
      success: (resp) =>
        @attachments.fetch  add: true, data: {post_id: resp.id}
        @comments.fetch     add: true, data: {post_id: resp.id}

    # @attachments.fetch  add: true, data: {post_id: resp.id}
    # @comments.fetch     add: true, data: {post_id: resp.id}


  render: ->
    @$el.html @template {post: @post}
    @

  appendComment: (comment) ->
    # debugger
    commentView = new BackboneBlog.Views.Comment(model: comment)
    commentView.render()
    @$('#list-of-comments').append commentView.el

  next: ->
    currentPage = parseInt(@posts.page)
    if @posts.totalPages > currentPage
      @posts.nextPage(currentPage) 
      @$('#posts').html ''
    false

  previous: ->
    currentPage = parseInt(@posts.page)
    if currentPage > 1
      @posts.previousPage(currentPage)
      @$('#posts').html ''
    false

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

  # reloadCommentsTable: ->
  #   @$('#list-of-comments').remove()
  #   @$('#list-of-comments').children.remove()
  #   $('#list-of-comments').remove()
  #   $('#list-of-comments').children().remove()

