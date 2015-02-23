class BackboneBlog.Views.Comment extends Backbone.View
  template: JST['comments/comment']
  tagName: 'li'

  events:
    'click #remove_comment': 'removeComment'

  initialize: (options) ->
    @comment  = options.model
    @router   = options.router

    @comment.on 'remove', @reloadCommentList, this

  render: ->
    comments = @comment.collection

    if comments.totalPages <= 1
      $('#next_comments_page').attr('disabled', 'disabled')
      $('#previous_comments_page').attr('disabled', 'disabled')

    @$el.html @template(comment: @comment)
    @

  removeComment: (e) ->
    e.preventDefault()

    if confirm('Are you sure') == true
      $('.notification-box').removeAttr('hidden')
      $('.notification-box').html("'#{@comment.get('title')}' has been successfully deleted!")
      @el.remove()
      @comment.destroy()
    else
      console.log 'You pressed Cancel!'

  reloadCommentList: ->
    @router.navigate "#posts/#{@comment.get('post_id')}", trigger: true
