class BackboneBlog.Views.PostsIndex extends Backbone.View
  templates:
    index: JST['posts/index']

  events: {
    'click a.previous' : 'previous'
    'click a.next'     : 'next'
  }

  initialize:  ->
    _.bindAll this, 'previous', 'next', 'render'
    @collection.bind('refresh', this)
    @collection.on 'read', @reloadTable, this
    @collection.on('add', @appendPost, this)
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
    debugger

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
  #
  appendPost: (post) ->
    view = new BackboneBlog.Views.Post(model: post)
    @$('#posts').append(view.render().el)
  #
  # createPost: (event) ->
  #   event.preventDefault()
  #   attributes = title: $('#new_post_title').val()
  #
  #   @collection.create attributes,
  #     wait: true
  #     success: ->
  #       $('#new_post')[0].reset()
  #
  #     error: @handleError
  #
  # handleError: (post, response) ->
  #   if response.status == 422
  #     errors = $.parseJSON(response.responseText).errors
  #     for attribute, messages of errors
  #       alert "#{attribute} #{message}" for message in messages
