class BackboneBlog.Views.Comment extends Backbone.View
  template: JST['comments/comment']
  tagName: 'li'
  events: {
    'click #remove_comment': 'removeComment'
  }

  render: ->
    console.log 'render!'
    $(@el).html(@template(comment: @model))
    @

  removeComment: (e) ->
    e.preventDefault()

    if confirm('Are you sure') == true
      $('.notification-box').removeAttr('hidden')
      $('.notification-box').html("'#{@model.get('title')}' has been successfully deleted!")
      console.log this
      console.log this.el
      # this.el.remove()
      @model.destroy()
    else
      # Do nothing
      # console.log @model.get('title')
      # console.log @model.get('id')
      console.log 'You pressed Cancel!'
