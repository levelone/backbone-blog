class BackboneBlog.Views.Comment extends Backbone.View
  template: JST['comments/comment']
  events:
    'click #remove_comment': 'removeComment'

  # initialize: (options) ->
  #   @comment = new BackboneBlog.Models.Comment({id: options.model.id})
  #   @comment.on 'change', @render, this
  #
  # fetch: ->
  #   @comment.fetch silent: false

  render: ->
    @$el.html @template(comment: @model)
    @

  removeComment: (e) ->
    e.preventDefault()

    if confirm('Are you sure') == true
      $('.notification-box').removeAttr('hidden')
      $('.notification-box').html("'#{@model.get('title')}' has been successfully deleted!")
      # this.el.remove()
      @model.destroy()
    else
      # Do nothing
      # console.log @model.get('title')
      # console.log @model.get('id')
      console.log 'You pressed Cancel!'
