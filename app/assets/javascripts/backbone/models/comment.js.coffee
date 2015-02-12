class BackboneBlog.Models.Comment extends Backbone.RelationalModel
  defaults:
    content: 'Good day'

BackboneBlog.Models.Comment.setup()
@comment = new BackboneBlog.Models.Comment()
console.log @comment
