class BackboneBlog.Views.PostNew extends Backbone.View
  template: JST['posts/new']
  events:
    # 'submit #new_post'      : 'updatePost'
    'click #submit_edit_post' : 'updatePost'
    'click #new_attachment'   : 'openJqueryFileUploader'

  initialize: (options) ->
    @post         = options.model
    @collection   = options.collection
    @router       = options.router
    @el           = options.el
    @attachments  = options.attachments

    @collection.on 'add', @addPostRecord, this


  render: ->
    $(@el).html @template(post: @post)
    @

  createAttachment: (post_id) ->
    attachment_attributes = {post_id: post_id, title: $('#new_attachment_title').val()}
    @attachments.create(attachment_attributes, wait: true)

  # Event Listeners
  updatePost: (e) ->
    e.preventDefault()

    post_attributes = {title: $('#new_post_title').val()}
    @post = @collection.update(post_attributes, wait: true)


  # Collection Events
  addPostRecord: (post) ->
    if $('#new_attachment_title').val().length > 0
      @createAttachment(post.id)

    @router.navigate "#posts/#{post.id}", trigger: true
