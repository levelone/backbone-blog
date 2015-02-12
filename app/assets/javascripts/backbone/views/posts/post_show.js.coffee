class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']
  events:
    'submit #new_post_comment' : 'leaveComment'

  initialize: (options) ->
    @post     = @model
    @router   = options.router
    # @comment  = @post.get('comments')

    # @post.on 'add', @leaveComment, this

  render: ->
    $(@el).html(@template(post: @post))
    @

  leaveComment: (e) ->
    e.preventDefault()

    # @post = new BackboneBlog.Models.Post(nestedmodel: @comment)
    # this.post.set("content", 'asdasd')

    comments = @post.get('comments')
    attributes =
      content: $('#new_comment').val()
      post_id: @$el.find('input[name=post_id]').val()

    # @post.set('comments', attributes)
    #
    # @post.save()
    debugger
    #
    # console.log e
    # console.log '---'
    # debugger
