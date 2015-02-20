class BackboneBlog.Views.PostEdit extends Backbone.View
  template: JST['posts/edit']
  events:
    'click input[type=submit]' : 'updatePost'
    'click #new_attachment'    : 'openJqueryFileUploader'

  initialize: (options) ->
    # Instantiate Collections/Models
    @post         = new BackboneBlog.Models.Post({id: options.id})
    @attachments  = new BackboneBlog.Collections.Attachments()
    @router       = options.router

    # Event Listeners
    @post.on 'change', @render, this

  fetch: ->
    @post.fetch silent: false

  render: ->
    @$el.html @template {post: @post}
    @

  # Event Listeners
  updatePost: (e) ->
    e.stopPropagation()
    e.preventDefault()

    @post.set
      title: @$el.find('input[name=title]').val()
      content: @$el.find('input[name=content]').val()

    @post.save wait: true
    @router.navigate "#posts/#{@post.get('id')}", trigger: true

  openJqueryFileUploader: (e) ->
    $('#new_attachment').fileupload({post_id: @post.get('id')})
    console.log '--jqueryfileuploader'
