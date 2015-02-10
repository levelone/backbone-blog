class PostsController < ApplicationController
  respond_to :json

  def index
    page      = params[:page] ||= 1
    per_page  = params[:per_page] ||= 10
    posts     = Post.page(page).per(per_page)

    render :json => {
      page: page,
      per_page: per_page,
      total_pages: posts.total_pages,
      models: posts.all
    }
  end

  def show
    respond_with Post.find(params[:id])
  end

  def create
    respond_with Post.create(params[:post])
  end

  def edit
    respond_with Post.find(params[:id])
  end

  def update
    respond_with Post.update(params[:id], params[:post])
  end

  def destroy
    respond_with Post.destroy(params[:id])
  end
end
