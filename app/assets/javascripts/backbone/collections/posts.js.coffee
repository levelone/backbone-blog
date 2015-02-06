class BackboneBlog.Collections.Posts extends Backbone.Collection
  url: '/api/posts'
  # GET /posts
  # POST /posts
  # GET /posts/1
  # PUT /posts/1
  # DELETE /posts/1
  model: BackboneBlog.Models.Post

  # Author = BackboneBlog.Model.Authors.extend({
  #   relations: [ {
  #     type: BackboneBlog.One,
  #     key: 'fname',
  #     relatedModel: 'Author'
  #   } ]
  #
  #   defaults:
  #     age: 0,
  #     fname: '',
  #     lname: ''
