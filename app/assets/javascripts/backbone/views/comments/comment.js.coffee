class BackboneBlog.Views.Comment extends Backbone.View
  template: JST['comments/comment']
  events:
    'click #remove_comment': 'removeComment'

  initialize: ->
    @model.on 'remove', @reloadCommentList, this

  render: ->
    comments = @model.collection
    if comments.totalPages <= 1
      $('#next_comments_page').attr('disabled', 'disabled')
      $('#previous_comments_page').attr('disabled', 'disabled')

    @$el.html @template(comment: @model)
    @

  removeComment: (e) ->
    e.preventDefault()

    if confirm('Are you sure') == true
      $('.notification-box').removeAttr('hidden')
      $('.notification-box').html("'#{@model.get('title')}' has been successfully deleted!")
      # @el.remove()
      $("#list-of-comments").html ""
      @model.destroy()
    else
      console.log 'You pressed Cancel!'

  reloadCommentList: ->
    location.reload true
