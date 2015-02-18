class BackboneBlog.Views.PostsIndex extends Backbone.View
  template: JST['posts/index']
  events:
    'click a#new_post' : 'newPost'
    'click a.previous' : 'previous'
    'click a.next'     : 'next'

  initialize: (options) ->
    @collection   = options.collection
    @router       = options.router

    _.bindAll         this, 'previous', 'next', 'render'
    @collection.bind  'refresh', this
    @collection.on    'read', @reloadTable, this
    @collection.on    'add', @appendPost, this
    # @pagination = new BackboneBlog.Views.Pagination

  render: ->
    @$el.html @template(posts: @collection.models)
    @collection.fetch
      add: true
      sync: true
      success: =>
        @reloadTable()
    @

  # Event Listeners
  newPost: (e) ->
    e.preventDefault()

    router = @router
    post   = @collection.create(new BackboneBlog.Models.Post(),{
      wait: true
      success: (resp) ->
        view = new BackboneBlog.Views.PostEdit(model: resp, router: router)
        @$('#posts').append view.render().el

        router.navigate "#posts/#{resp.get('id')}/edit", trigger: true
    })


  previous: ->
    @collection.previousPage()
    false

  next: ->
    @collection.nextPage()
    false

  # Collection Events
  appendPost: (post, options) ->
    options = options || false
    # if options == true
      # console.log post
      # debugger

    view = new BackboneBlog.Views.Post(model: post)
    @$('#posts').append(view.render().el)

  reloadTable: ->
    # paginationHtml = @pagination.render(@collection).$el
    # @$('.pagination-container').html(paginationHtml)
    # # debugger
