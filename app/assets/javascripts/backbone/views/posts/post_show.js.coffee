class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']
  events:
    'submit #new_comment' : 'leaveComment'

  initialize: (options) ->
    @post     = @model
    @router   = options.router
    # @comment  = @post.get('comments')

    debugger
    # @post.on 'add', @leaveComment, this

  render: ->
    $(@el).html(@template(post: @post))
    @

  leaveComment: (e) ->
    e.preventDefault()

    # @post = new BackboneBlog.Models.Post(nestedmodel: @comment)
    # this.post.set("content", 'asdasd')

    attributes =
      content: @$el.find('input[name=content]').val()

    debugger
    @post.save attributes
    
    console.log e
    console.log '---'
    debugger
