class BackboneBlog.Views.PostEdit extends Backbone.View
  template: JST['posts/edit']

  events:
    'click input[type=submit]' : 'updatePost'
    'click #new_attachment'    : 'openJqueryFileUploader'

  initialize: (options) ->
    console.log options
    @posts        = options.collection
    @post         = options.model
    @router       = options.router
    @el           = options.el
    @attachments  = options.attachments
    @comments     = options.comments

  render: ->
    @$el.html @template(post: @post)
    @

  # Event Listeners
  updatePost: (e) ->
    e.stopPropagation()
    e.preventDefault()

    attributes =
      title:    @$el.find('input[name=title]').val()
      content:  @$el.find('input[name=content]').val()

    @post.save attributes

    # view = new BackboneBlog.Views.PostShow
    #   collection:   @posts
    #   model:        @post
    #   router:       @router
    #   el:           @el
    #   attachments:  @attachments
    #   comments:     @comments
    #
    # @$('#posts').append view.render().el
    @router.navigate "#posts/#{@post.get('id')}", trigger: true

  openJqueryFileUploader: (e) ->
    $('#new_attachment').fileupload()
    console.log '--jqueryfileuploader'
