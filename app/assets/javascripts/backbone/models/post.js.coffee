class BackboneBlog.Models.Post extends Backbone.Model
  defaults:
    title:    'Rename me'
    content:  'Describe me'
    permalink:  ''

  url: ->
    base = "/api/posts"
    if @isNew()
      base
    else
      "#{base}/#{@id}"
