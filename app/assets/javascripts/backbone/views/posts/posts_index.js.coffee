class BackboneBlog.Views.PostsIndex extends Backbone.View
  template: JST['posts/index']
  events:
    'submit #new_post' : 'createPost'

  initialize: ->
    @collection.on('add', @appendPost, this)

  render: ->
    @collection.fetch(add: true)
    @setElement(@template())
    # $(@el).html(@template())
    this

  appendPost: (post) ->
    view = new BackboneBlog.Views.Post(model: post)
    $('#posts').append(view.render().el)

  createPost: (event) ->
    event.preventDefault()
    attributes = title: $('#new_post_title').val()

    @collection.create attributes,
      wait: true
      success: ->
        $('#new_post')[0].reset()
        
      error: @handleError

  handleError: (post, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
