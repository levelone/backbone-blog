class BackboneBlog.Views.PostNew extends Backbone.View
  template: JST['posts/new']
  events:
    'submit #new_post'        : 'createPost'
    'submit #new_attachment'  : 'createAttachment'

  initialize: (options) ->
    @post         = options.model
    @collection   = options.collection
    @router       = options.router
    @el           = options.el
    @attachments  = options.attachments
    console.log   @attachments

    @collection.on 'add', @addPostRecord, this

  render: ->
    $(@el).html @template(post: @post)
    @

  createPost: (e) ->
    e.preventDefault()

    attributes =
      title: $('#new_post_title').val()

    # Create Model Post in Collection
    @post = @collection.create(attributes, wait: true)

  addPostRecord: (post) ->
    console.log "posts"
    console.log post.id
    @router.navigate "#posts/#{post.id}", trigger: true

  createAttachment: (e) ->
    console.log @attachments
    attributes =
      title: $('#new_attachment_title').val()

    debugger
    @attachments.create(attributes, wait: true)
