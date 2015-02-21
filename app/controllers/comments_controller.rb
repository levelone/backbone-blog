class CommentsController < ApplicationController
  respond_to :json

  def index
    page      = params[:page] ||= 1
    per_page  = params[:per_page] ||= 10

    comments = if params[:post_id]
      Comment.where(post_id: params[:post_id]).order('created_at DESC').page(page).per(per_page)
    else
      Comment.all
    end

    render json: {
      page: page,
      per_page: per_page,
      total_pages: comments.total_pages,
      models: comments
    }
  end

  def show
    respond_with Comment.find(params[:id])
  end

  def create
    respond_with Comment.create(params[:comment])
  end

  def edit
    respond_with Comment.find(params[:id])
  end

  def update
    respond_with Comment.update(params[:id], params[:comment])
  end

  def destroy
    respond_with Comment.destroy(params[:id])
  end
end
