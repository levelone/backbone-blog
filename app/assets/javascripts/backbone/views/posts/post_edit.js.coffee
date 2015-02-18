class BackboneBlog.Views.PostEdit extends Backbone.View
  template: JST['posts/edit']

  events:
    'click input[type=submit]' : 'updatePost'
    'click #new_attachment'    : 'openJqueryFileUploader'

  initialize: (options) ->
    @collection  = options.model.collection
    @model       = options.model
    @router      = options.router

  render: ->
    @$el.html @template(post: @model)
    @

  # Event Listeners
  updatePost: (e) ->
    e.stopPropagation()
    e.preventDefault()

    attributes = 
      title:    @$el.find('input[name=title]').val()
      content:  @$el.find('input[name=content]').val()

    @model.save attributes
    @router.navigate "#posts/#{@model.id}", trigger: true

  openJqueryFileUploader: (e) ->
    $('#new_attachment').fileupload()
    console.log '--jqueryfileuploader'
