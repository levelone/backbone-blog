class BackboneBlog.Views.Post extends Backbone.View
  template: JST['posts/post']
  events:
    'click #view_post'    : 'viewPost'
    'click #edit_post'    : 'editPost'
    'click #remove_post'  : 'removePost'

  initialize: (options) ->
    @post         = options.model
    @attachments  = options.attachments
    @comments     = options.comments
    @router       = options.router

  render: ->
    @setElement @template(post: @post)
    @

  # Event Listeners
  viewPost: (e) ->
    e.preventDefault()
    @router.navigate "#posts/#{@post.id}", trigger: true

  editPost: (e) ->
    e.preventDefault()
    @router.navigate "#posts/#{@post.id}/edit", trigger: true

  removePost: (e) ->
    e.preventDefault()

    if confirm('Are you sure') == true
      $('.notification-box').removeAttr 'hidden'
      $('.notification-box').html "'#{@post.get('title')}' has been successfully deleted!"
      @el.remove()
      @model.destroy()
    else
      # Do nothing
      console.log 'You pressed Cancel!'
