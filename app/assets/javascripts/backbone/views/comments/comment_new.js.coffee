class BackboneBlog.Views.CommentNew extends Backbone.View
  # template: JST['post/show']

  initialize: (options) ->
    @comment  = options.comment
    @router   = options.router

  # render: ->
  #   @createComment
  #   @router.navigate "#posts/#{@comment.get('post_id')}", trigger: true

  createComment: ->
    console.log @collection
    console.log @comment
    console.log @router
    console.log '---'

    @collection.create(@comment.attributes, wait: true)

    # $(@el).html(@template(post: @post))
    # @setElement @template()
    # this

  # createPost: (event) ->
  #   event.preventDefault()
  #
  #   attributes =
  #     title: $('#new_post_title').val()
  #     # author: $('#new_post_author').val()
  #
  #   # Create Model Post in Collection
  #   @post = @collection.create(attributes, wait: true)
  #
  # addPostRecord: (post) ->
  #   console.log "posts"
  #   console.log post.id
  #   @router.navigate "#posts/#{post.id}", trigger: true
