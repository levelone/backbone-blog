class BackboneBlog.Views.Post extends Backbone.View
  template: JST['posts/post']
  tagName: 'li'
  events: {
    'click #view_post'    : 'viewPost'
    'click #edit_post'    : 'editPost'
    'click #remove_post'  : 'removePost'
  }

  initialize: (options) ->
    @post         = options.model
    @attachments  = options.attachments
    @comments     = options.comments
    @router       = options.router

  render: ->
    $(@el).html(@template(post: @post))
    this

  # Event Listeners
  viewPost: (e) ->
    e.preventDefault()
    postShowView = new BackboneBlog.Views.PostShow
      el:           $('#container')
      model:        @post
      attachments:  @attachments
      comments:     @comments
      router:       @router

    postShowView.render()
    @router.navigate "#posts/#{@post.id}", trigger: true

  editPost: (e) ->
    e.preventDefault()
    postEditView = new BackboneBlog.Views.PostEdit
      el:           $('#container')
      model:        @post
      attachments:  @attachments
      comments:     @comments
      router:       @router

    postEditView.render()
    @router.navigate "#posts/#{@post.id}/edit", trigger: true

  removePost: (e) ->
    e.preventDefault()

    if confirm('Are you sure') == true
      $('.notification-box').removeAttr('hidden')
      $('.notification-box').html("'#{@post.get('title')}' has been successfully deleted!")
      this.el.remove()
      @model.destroy()
    else
      # Do nothing
      # console.log @model.get('title')
      # console.log @model.get('id')
      console.log 'You pressed Cancel!'
