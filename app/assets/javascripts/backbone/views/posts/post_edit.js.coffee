class BackboneBlog.Views.PostEdit extends Backbone.View
  template: JST['posts/edit']
  events:
    'click input[type=submit]'  : 'updatePost'
    'click #attachment_image'         : 'openJqueryFileUploader'

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

    @post.save(@post, {patch: true})
    @router.navigate "#posts/#{@post.get('id')}", trigger: true

  openJqueryFileUploader: (e) ->
    # $('#new_attachment').fileupload('disable')
    $('#attachment_image').fileupload
      sequentialUploads: true
      post_id: @post.get('id')
      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        $('#progress .bar').css 'width', progress + '%'

      # drop: (e, data) ->
      #   $.each data.files, (index, file) ->
      #     alert('Dropped file: ' + file.name)
      #
      # change: (e, data) ->
      #   $.each data.files, (index, file) ->
      #     alert('Selected file: ' + file.name)

        progress_data = $('#attachment_image').fileupload('progress')
        active_uploads = $('#attachment_image').fileupload('active')
        console.log '------'
        console.log progress_data
        console.log active_uploads

    console.log '--jqueryfileuploader'
