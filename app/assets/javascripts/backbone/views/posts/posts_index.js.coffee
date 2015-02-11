class BackboneBlog.Views.PostsIndex extends Backbone.View
  templates:
    index: JST['posts/index']

  events: {
    'click a.previous' : 'previous'
    'click a.next'     : 'next'
  }

  initialize: ->
    _.bindAll this, 'previous', 'next', 'render'
    @collection.bind('refresh', this)
    @collection.on 'read', @reloadTable, this
    @collection.on 'add', @appendPost, this
    # @pagination = new BackboneBlog.Views.Pagination

  render: ->
    # @el.html BackboneBlog.templates.pagination(@collection.pageInfo())
    # @el.html @template(@collection.pageInfo())
    # $(@el).html(@template(@collection.pageInfo()))
    @setElement(@templates.index())
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

  appendPost: (post) ->
    view = new BackboneBlog.Views.Post(model: post)
    @$('#posts').append(view.render().el)
