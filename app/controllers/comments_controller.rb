class CommentsController < ApplicationController
  respond_to :json

  def index
    comments = if params[:post_id]
      Comment.where(post_id: params[:post_id])
    else
      Comment.all
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
