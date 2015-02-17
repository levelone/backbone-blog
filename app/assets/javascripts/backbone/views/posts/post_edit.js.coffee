class BackboneBlog.Views.PostEdit extends Backbone.View
  template: JST['posts/edit']

  events:
    'click input[type=submit]' : 'update'

  initialize: (options) ->
    @collection  = options.collection
    @model       = options.model
    @router      = options.router

  render: ->
    console.log @model
    @$el.html @template(post: @model)
    @

  update: (e) ->
    e.stopPropagation()
    e.preventDefault()

    attributes =
      title: @$el.find('input[name=title]').val()

    @model.save attributes

    console.log @model
    # Navigate to show page
    @router.navigate("#posts/#{@model.get('id')}", trigger: true)
