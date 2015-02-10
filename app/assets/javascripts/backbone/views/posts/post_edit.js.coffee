class BackboneBlog.Views.PostEdit extends Backbone.View
  templates:
    edit: JST['posts/edit']

  events:
    'click input[type=submit]' : 'update'

  initialize: (options) ->
    @post   = @model
    @router = options.router

  render: ->
    @setElement(@templates.edit(post: @post))
    @

  update: (e) ->
    e.stopPropagation()
    e.preventDefault()

    # Define Attributes
    attributes = { title: @$el.find('input[name=title]').val() }

    # Update Model Post in Collection
    @post.save attributes

    # Navigate to show page
    @router.navigate("#posts/#{@post.get('id')}", trigger: true)
