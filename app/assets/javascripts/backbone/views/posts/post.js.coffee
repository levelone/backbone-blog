class BackboneBlog.Views.Post extends Backbone.View
  template: JST['posts/post']
  tagName: 'li'
  events: {
    'click #remove_post': 'removePost'
  }

  initialize: (options) ->
    @page = options.page
    console.log @page

  render: ->
    $(@el).html(@template(post: @model))
    console.log this
    this

  removePost: (event) ->
    event.preventDefault()

    if confirm('Are you sure') == true
      $('.notification-box').removeAttr('hidden')
      $('.notification-box').html("'#{@model.get('title')}' has been successfully deleted!")
      this.el.remove()
      @model.destroy()
    else
      # Do nothing
      # console.log @model.get('title')
      # console.log @model.get('id')
      console.log 'You pressed Cancel!'
