class BackboneBlog.Views.PostsIndex extends Backbone.View
  template: JST['posts/index']
  events:
    'click a#new_post' : 'newPost'
    'click a.previous' : 'previous'
    'click a.next'     : 'next'

  initialize: (options) ->
    @posts        = options.collection
    @attachments  = options.attachments
    @comments     = options.comments
    @router       = options.router

    _.bindAll    this, 'previous', 'next', 'render'
    @posts.bind  'refresh', this
    @posts.on    'read', @reloadTable, this
    @posts.on    'add', @appendPost, this
    # @pagination = new BackboneBlog.Views.Pagination

  render: ->
    @$el.html @template(posts: @posts.models)
    @posts.fetch
      add: true
      sync: true
      success: =>
        @reloadTable()
    @

  # Event Listeners
  newPost: (e) ->
    e.preventDefault()

    router = @router
    post   = @posts.create(new BackboneBlog.Models.Post(),{
      wait: true
      success: (resp) ->
        view = new BackboneBlog.Views.PostEdit
          model: resp
          router: router
        @$('#posts').append view.render().el

        router.navigate "#posts/#{resp.get('id')}/edit", trigger: true
    })


  previous: ->
    @posts.previousPage()
    false

  next: ->
    @posts.nextPage()
    false

  # Collection Events
  appendPost: (post, options) ->
    options = options || false
    # if options == true
      # console.log post
      # debugger

    view = new BackboneBlog.Views.Post(model: post, router: @router, attachments: @attachments, comments: @comments)
    @$('#posts').append(view.render().el)

  reloadTable: ->
    # paginationHtml = @pagination.render(@collection).$el
    # @$('.pagination-container').html(paginationHtml)
    # # debugger
