class BackboneBlog.Views.PostNew extends Backbone.View
  template: JST['posts/new']
  events:
    'submit #new_post' : 'createPost'

  initialize: (options) ->
    @post       = options.post
    @collection = options.collection
    @router     = options.router

    @collection.on 'add', @addPostRecord, this
    console.log @post
    console.log @collection
    console.log @router

  render: ->
    # $(@el).html(@template(post: @post))
    @setElement @template()
    this

  createPost: (event) ->
    event.preventDefault()

    attributes =
      title: $('#new_post_title').val()
      # author: $('#new_post_author').val()

    # Create Model Post in Collection
    @post = @collection.create(attributes, wait: true)

  addPostRecord: (post) ->
    console.log "posts"
    console.log post.id
    @router.navigate "#posts/#{post.id}", trigger: true
