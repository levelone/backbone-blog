class AttachmentsController < ApplicationController
  respond_to :json

  def index
    attachments = if params[:post_id]
      Attachment.where(post_id: params[:post_id])
    else
      Attachment.all
    end

    respond_with attachments
  end

  def show
    respond_with Attachment.find(params[:id])
  end

  def create
    respond_with attachment = Attachment.create(
      post_id:    params[:post_id],
      title:      params[:attachment][:image].original_filename,
      file_type:  params[:attachment][:image].content_type,
      image:      params[:attachment][:image]
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
