class BackboneBlog.Views.PostShow extends Backbone.View
  template: JST['posts/show']
  events:
    'submit #new_comment' : 'createComment'
    'click #destroy_comment' : 'destroyComment'

  initialize: (options) ->
    @post   = @model
    @router = options.router

    @commentCollection = new BackboneBlog.Collections.Comments({model: BackboneBlog.Models.Post})

  render: ->
    @post.fetch()
    $(@el).html(@template(post: @post))
    @

  createComment: (e) ->
    e.preventDefault()

    attributes =
      content: $('#new_comment_content').val()
      post_id: $('#new_comment_post_id').val()

    view = new BackboneBlog.Views.CommentNew(collection: @commentCollection, comment: new BackboneBlog.Models.Comment(attributes), router: @router)
    $('.comments-container').html view.createComment().el

  # editComment: (e) ->
  #   view = new BackboneBlog.Views.CommentEdit(collection: @commentCollection, comment: new BackboneBlog.Models.Comment(attributes), router: @router)
  #   $('.comments-container').html view.editComment().el

  destroyComment: (e) ->
    view = new BackboneBlog.Views.Comment(collection: @commentCollection, comment: new BackboneBlog.Models.Comment(attributes), router: @router)
    $('.comments-container').html view.destroyComment().el


  destroyComment: (e) ->
    e.preventDefault()

    console.log @commentCollection
    debugger

    # if confirm('Are you sure') == true
    #   $('.notification-box').removeAttr('hidden')
    #   $('.notification-box').html("'#{@commentCollection.get('title')}' has been successfully deleted!")
    #   this.el.remove()
    #   @model.destroy()
    # else
    #   # Do nothing
    #   # console.log @model.get('title')
    #   # console.log @model.get('id')
    #   console.log 'You pressed Cancel!'
