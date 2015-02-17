class BackboneBlog.Routers.Attachments extends Backbone.Router
  routes:
    'attachments' : 'index'
    # 'posts/:id/edit'  : 'edit'
    # 'posts/:id'       : 'show'

  initialize: ->
    @collection = new BackboneBlog.Collections.Attachments()

  index: ->
    console.log 'index router method'
