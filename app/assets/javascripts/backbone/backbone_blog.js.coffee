window.BackboneBlog =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    window.routerPosts    = new BackboneBlog.Routers.Posts()
    window.routerComments = new BackboneBlog.Routers.Comments()
    # window.routerTags     = new BackboneBlog.Routers.Tags()
    # window.routerAuthors  = new BackboneBlog.Routers.Authors()

    # window.routerCampaigns = new Tapp.Routers.Campaigns()
    # window.routerBrands    = new Tapp.Routers.Brands()
    # window.routerCompanies = new Tapp.Routers.Companies()
    Backbone.history.start()

$(document).ready ->
  BackboneBlog.initialize()
