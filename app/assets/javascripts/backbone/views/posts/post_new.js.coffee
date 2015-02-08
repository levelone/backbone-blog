class BackboneBlog.Views.PostNew extends Backbone.View
  template: JST['posts/new']
  events:
    'submit #new_post' : 'createPost'
    # 'submit #new_post' : 'validatePost'

  initialize: (options) ->
    console.log options.post
    console.log options.collection
    @post = options.post
    @collection = options.collection

  render: ->
    console.log 'new page'
    @setElement(@template())
    # $(@el).html(@template(post: @post))
    this

  createPost: (event) ->
    event.preventDefault()
    attributes =
      title: $('#new_post_title').val()
      author: $('#new_post_author').val()

    @collection.create attributes,
      wait: true
      success: ->
        post = event.result
        console.log post
        console.log post.id
        console.log $('#container')
        currentView = new BackboneBlog.Views.PostShow(post: post.id)
        $('#container').html(currentView.render().el)
        # $('#notification-box')
        # $('#new_post')
