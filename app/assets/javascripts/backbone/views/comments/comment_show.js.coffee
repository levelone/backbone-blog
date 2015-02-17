class BackboneBlog.Views.CommentShow extends Backbone.View
  templates:
    show:   JST['comment/show']
    delete: JST['comment/destroy']

  initialize: (options) ->
    @comment  = options.comment
    @router   = options.router
    @event    = options.event

    # destroyComment(e)

  # render: ->
    #@createComment
    #@router.navigate "#posts/#{@comment.get('post_id')}", trigger: true

  destroyComment: ->
    console.log @event
    if confirm('Are you sure') == true
      $(".destroy_comment[data-id='#{@event.id}']").parent().remove()
      @comment.destroy({
        wait: true
        success: (response) ->
         console.log 'hi'
      })
      @comment
    else
      console.log 'You pressed Cancel!'

    debugger

