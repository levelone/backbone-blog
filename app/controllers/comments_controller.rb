class CommentsController < ApplicationController
  respond_to :json

  def index
    page      = params[:page] ||= 1
    per_page  = params[:per_page] ||= 10
    arranged_comments = Comment.order('created_at DESC').page(page).per(per_page)

    comments = if params[:post_id]
      arranged_comments.where(post_id: params[:post_id])
    else
      arranged_comments
    end

    respond_with comments
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
