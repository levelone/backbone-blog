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
    _.bindAll   this, 'previous', 'next', 'render'
    @posts.bind 'refresh', this
    @posts.on   'add', @appendPost, this
    @posts.on   'change', @reloadTable, this

  render: ->
    @setElement @template(post: @posts.models)
    # @$el.html @template {post: @posts.models}
    @posts.fetch add: true, sync: true
    @

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

  next: ->
    currentPage = parseInt(@posts.page)
    if @posts.totalPages > currentPage
      @posts.nextPage(currentPage) 
      @$('#posts').html ''
      debugger
    false

  previous: ->
    currentPage = parseInt(@posts.page)
    if currentPage > 1
      @posts.previousPage(currentPage)
      @$('#posts').html ''
    false

  appendPost: (post, options) ->
    options = options || false

    view = new BackboneBlog.Views.Post(model: post, router: @router)
    @$('#posts').append(view.render().el)

  reloadTable: ->
    @$('#posts').remove()
    debugger
    @render
    # @posts.fetch()
    # @$el.html @template(posts: @posts.models)
    # pageinatePosts = @render(@posts)
    # paginateHtml = @pagination.render(@posts).$el
    # @$('#posts').html paginateHtml

    # paginationHtml = @pagination.render(@collection).$el
    # @$('.pagination-container').html(paginationHtml)
