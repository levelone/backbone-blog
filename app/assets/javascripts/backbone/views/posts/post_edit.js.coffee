class BackboneBlog.Views.PostEdit extends Backbone.View
  template: JST['posts/edit']

  events:
    'click input[type=submit]' : 'update'

  initialize: (options) ->
    postId  = options.postId
    @post   = new BackboneBlog.Models.Post(id: postId)
    @router = options.router

  render: ->
    @post.fetch
      success: (resp) =>
        @renderTemplate()
    this

  renderTemplate: ->
    $(@el).html(@template(post: @post))
    this

  update: (event) ->
    event.stopPropagation()
    event.preventDefault()

    post        = this.post
    router      = this.router

    attributes  =
      title: this.$el.find('input[name=title]').val()

    # Update Model Post in Collection
    post.save attributes

    router.navigate "#posts/#{post.id}", trigger: true
