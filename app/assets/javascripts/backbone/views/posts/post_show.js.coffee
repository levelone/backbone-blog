class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']
  events:
    'submit #new_comment'             : 'newComment'
    'click #edit_post'                : 'editPost'
    'click #view_posts'               : 'viewPosts'
    'click a#previous_comments_page'  : 'previousComments'
    'click a#next_comments_page'      : 'nextComments'

  initialize: (options) ->
    # Instantiate Collections/Models
    @post         = new BackboneBlog.Models.Post({id: options.id})
    @attachments  = new BackboneBlog.Collections.Attachments({post_id: options.id})
    @comments     = new BackboneBlog.Collections.Comments({post_id: options.id})
    @router       = options.router

    # Event Listeners
    _.bindAll       this, 'previousComments', 'nextComments', 'fetch'
    @post.on        'change', @render, this
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

  render: ->
    @$el.html @template {post: @post}
    @

  appendComment: (comment) ->
    commentView = new BackboneBlog.Views.Comment(model: comment)
    commentView.render()
    @$('#list-of-comments').append commentView.el

  nextComments: ->
    post_id       = @comments.models[0].get('post_id')
    current_page  = parseInt(@comments.page)

    if @comments.totalPages > current_page 
      @comments.nextComments(current_page, post_id)
      @$("#list-of-comments").html ""
    # else
    #   @$("#next_comments_page")
    false

  previousComments: ->
    post_id       = @comments.models[0].get('post_id')
    current_page  = parseInt(@comments.page)

    if current_page > 1
      @comments.previousComments(current_page, post_id)
      @$('#list-of-comments').html ''
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
