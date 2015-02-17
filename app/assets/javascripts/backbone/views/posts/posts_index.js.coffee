class BackboneBlog.Views.PostsIndex extends Backbone.View
  template: JST['posts/index']

  events: {
    'click a.previous' : 'previous'
    'click a.next'     : 'next'
  }

  initialize: (options) ->
    @collection = options.collection
    @router = options.router

    _.bindAll this, 'previous', 'next', 'render'
    @collection.bind('refresh', this)
    @collection.on 'read', @reloadTable, this
    @collection.on 'add', @appendPost, this
    # @pagination = new BackboneBlog.Views.Pagination

  render: ->
    @$el.html @template(posts: @collection.models)
    @collection.fetch
      add: true
      sync: true
      success: =>
        @reloadTable()
    @

  reloadTable: ->
    # paginationHtml = @pagination.render(@collection).$el
    # @$('.pagination-container').html(paginationHtml)
    # # debugger

  previous: ->
    @collection.previousPage()
    false

  next: ->
    @collection.nextPage()
    false

  # initialize: ->
  #   @collection.on('add', @appendPost, this)
  #
  # render: ->
  #   @collection.fetch(add: true)
  #   @setElement(@template())
  #   this

  appendPost: (post) ->
    view = new BackboneBlog.Views.Post(model: post)
    @$('#posts').append(view.render().el)
