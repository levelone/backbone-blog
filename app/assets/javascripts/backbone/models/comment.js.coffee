class BackboneBlog.Models.Comment extends Backbone.RelationalModel
  defaults:
    content: 'Good day'

BackboneBlog.Models.Comment.setup()
@comment = new BackboneBlog.Models.Comment()
console.log @comment
# console.log x = BackboneBlog.Models.Comment()
# console.log y = 

  # relations: [
  #   type: Backbone.HasOne
  #   key: 'post'
  #   relatedModel: 'Post'
  #   includeInJSON: '_id'
  #   reverseRelation:
  #     type: Backbone.HasMany
  #     includeInJSON: '_id'
  #     key: 'comments'
  #     # 'relatedModel' is automatically set to 'Zoo'; the 'relationType' to 'HasOne'.
  # ]
