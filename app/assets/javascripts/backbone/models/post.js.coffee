class BackboneBlog.Models.Post extends Backbone.RelationalModel
  default:
    title: 'Good Morning'

  relations: [
    type: Backbone.HasMany
    key: 'comments'
    relatedModel: 'Comment'
    includeInJSON: '_id'
    reverseRelation:
      type: Backbone.HasOne
      includeInJSON: '_id'
      key: 'post'
      # 'relatedModel' is automatically set to 'Zoo'; the 'relationType' to 'HasOne'.
  ]

BackboneBlog.Models.Post.setup()
@post = new BackboneBlog.Models.Post(nestedmodel: @comment)
console.log @post

