class AttachmentsController < ApplicationController
  respond_to :json

  def index
    respond_with Attachment.all
  end

  def show
    respond_with Attachment.find(params[:id])
  end

  def create
    respond_with Attachment.create(
      post_id:    params[:post_id],
      title:      params[:title].original_filename,
      file_type:  params[:title].content_type
    )
  end

  def edit
    respond_with Attachment.find(params[:id])
  end

  def update
    respond_with Attaachment.update_attributes(params[:id], params[:attachment])
  end

  def destroy
    respond_with Attachment.destroy(params[:id])
  end
end
