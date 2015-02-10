class BackboneBlog.Collections.Posts extends Backbone.Collection
  initialize: ->
    _.bindAll this, 'parse', 'url', 'pageInfo', 'nextPage', 'previousPage'
    @page = 1

  fetch: (options) ->
    options || (options = {})
    @trigger("fetching")
    self    = this
    success = options.success
    options.success = (resp) ->
      self.trigger("fetched")
      if success
        success self, resp
      return

    Backbone.Collection.prototype.fetch.call(this, options)

  parse: (resp) ->
    @page = resp.page
    @perPage = resp.per_page
    @totalPages = resp.total_pages
    debugger
    resp.models

  url: ->
    '/api/posts' + '?' + $.param({page: @page})

  pageInfo: ->
    info =
      totalPages: @totalPages
      page: @page
      perPage: @perPage
      pages: Math.ceil(@total / @perPage)
      prev: false
      next: false
 

    max = Math.min(@total, @page * @perPage)
 
    if (@total == @pages * @perPage)
      max = @total
 
    info.range = [(@page - 1) * @perPage + 1, max]
 
    if (@page > 1)
      @prev = @page - 1
 
    if (@page < info.pages)
      info.next = @page + 1
 
    info

  nextPage: ->
    @page = @page + 1
    @fetch()

  previousPage: ->
    @page = @page - 1
    @fetch()

  model: BackboneBlog.Models.Post
