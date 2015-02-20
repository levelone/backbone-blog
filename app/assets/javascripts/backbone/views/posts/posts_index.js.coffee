class BackboneBlog.Views.PostsIndex extends Backbone.View
  template: JST['posts/index']
  events:
    'click a#new_post'      : 'newPost'
    'click a#previous_page' : 'previous'
    'click a#next_page'     : 'next'

  initialize: (options) ->
    # Instantiate Collections/Model
    @posts  = new BackboneBlog.Collections.Posts()
    @router = options.router

    # Event Listeners
    _.bindAll    this, 'previous', 'next', 'render'
    @posts.bind  'refresh', this
    @posts.on    'read', @reloadTable, this
    @posts.on    'add', @appendPost, this
    # # @pagination = new BackboneBlog.Views.Pagination

  render: ->
    @setElement @template(post: @posts.models)
    @posts.fetch add: true, sync: true
    @

  # ---------------
  # ---------------
  newPost: (e) ->
    e.preventDefault()
    debugger

    router = @router
    post   = @posts.create new BackboneBlog.Models.Post(),
      wait: true
      success: (resp) ->
        view = new BackboneBlog.Views.PostEdit({ model: resp, router: router})
        @$('#posts').append view.render().el

        router.navigate "#posts/#{resp.get('id')}/edit", trigger: true

  previous: ->
    @posts.previousPage()
    false

  next: ->
    @posts.reset()
    @posts.page
    @posts.fetch(data: {page: @posts.page})
    false

  appendPost: (post, options) ->
    options = options || false

    view = new BackboneBlog.Views.Post(model: post, router: @router)
    @$('#posts').append(view.render().el)

  # reloadTable: ->
    # @posts.fetch()
    # @$el.html @template(posts: @posts.models)
    # pageinatePosts = @render(@posts)
    # paginateHtml = @pagination.render(@posts).$el
    # @$('#posts').html paginateHtml

    # paginationHtml = @pagination.render(@collection).$el
    # @$('.pagination-container').html(paginationHtml)
