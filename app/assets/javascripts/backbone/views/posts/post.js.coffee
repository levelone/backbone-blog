class BackboneBlog.Views.Post extends Backbone.View
  template: JST['posts/post']
  tagName: 'li'
  events: {
    'click #show_post': 'showPost'
    'click #edit_post': 'editPost'
    'click #delete_post': 'removePost'
  }

  initialize: ->
    @model.on('sync', @render, this)

  render: ->
    $(@el).html(@template(post: @model))
    this

  showPost: ->
    post_show = new BackboneBlog.Views.PostShow(post_details: @model)
    console.log 'go to show'
    console.log post_show
    $('.post-container').children().remove()
    $('.post-container').append(post_show.render().el)
    # console.log this.el
    # $('#posts').remove()
    # $('#posts').append(details.render().el)
    # console.log view_details
    # $('#posts').append(view_details.render().el)

  editPost: (model) ->
    console.log 'go to edit'
    view_details = new BackboneBlog.Views.Post(post_details: model)

  removePost: (event) ->
    event.preventDefault()

    console.log this.el.remove()
    console.log @model.get('title')
    console.log @model.get('id')

    this.el.remove()
    @model.destroy()
