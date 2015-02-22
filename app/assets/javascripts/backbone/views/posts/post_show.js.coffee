class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']
  events:
    'submit #new_comment'           : 'newComment'
    'click #edit_post'              : 'editPost'
    'click #view_posts'             : 'viewPosts'
    'click #previous_comments_page' : 'previousComments'
    'click #next_comments_page'     : 'nextComments'

  # Instantiate Collections/Models
  # Event Listeners
  initialize: (options) ->
    @post         = new BackboneBlog.Models.Post({id: options.id})
    @attachments  = new BackboneBlog.Collections.Attachments({post_id: options.id})
    @comments     = new BackboneBlog.Collections.Comments({post_id: options.id})
    @router       = options.router

    _.bindAll       this, 'previousComments', 'nextComments', 'fetch'
    @post.on        'change', @render, this
    @comments.on    'add', @appendComment, this
    @comments.on    'change', @prependComment, this

  # Clear Comments to fetch updated state
  fetch: ->
    @$('#list-of-comments').html ''
    @post.fetch
      silent: false
      wait: true
      success: (resp) =>
        @attachments.fetch  add: true, data: {post_id: resp.id}
        @comments.fetch     add: true, data: {post_id: resp.id}

  # Render skeleton html page
  render: ->
    @$el.html @template {post: @post}
    @

  # Append comments with descending order
  # Through comments controller
  appendComment: (comment, collection, options) ->
    current_page  = parseInt(@comments.page)
    next          = $('#next_comments_page')
    previous      = $('#previous_comments_page')

    # Check pages if last or first page..
    # Try to encapsulate this code
    if current_page == 1 && @comments.totalPages > 1
      next.removeAttr('disabled')
      previous.attr('disabled', 'disabled')
    else if current_page == @comments.totalPages
      next.attr('disabled', 'disabled')
      previous.removeAttr('disabled')
    else
      next.removeAttr('disabled')
      previous.removeAttr('disabled')

    commentView = new BackboneBlog.Views.Comment(model: comment)
    commentView.render()

    # Prepend if comment is new
    if options.new_comment == true
      @$('#list-of-comments').prepend commentView.el
    else
      @$('#list-of-comments').append commentView.el

  nextComments: ->
    post_id       = @comments.models[0].get('post_id')
    current_page  = parseInt(@comments.page)

    if @comments.totalPages > current_page
      @comments.nextComments(current_page, post_id)
      @$("#list-of-comments").html ""
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

    view = new BackboneBlog.Views.CommentNew(comments: @comments, comment: new BackboneBlog.Models.Comment(), router: @router)
    $('#list-of-comments').prepend view.createComment()

  editPost: (e) ->
    e.preventDefault()
    @router.navigate "#posts/#{@post.id}/edit", trigger: true

  viewPosts: (e) ->
    e.preventDefault()
    @router.navigate "#", trigger: true
