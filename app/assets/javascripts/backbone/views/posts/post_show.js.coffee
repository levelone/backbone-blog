class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']
  tagName: 'div'

  render: ->
    @setElement(@template(post: @model))
