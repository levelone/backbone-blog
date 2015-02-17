class AttachmentsController < ApplicationController
  respond_to :json

  def index
    respond_with Attachment.all
  end

  def show
    respond_with Attachment.find(params[:id])
  end

  def create
    puts 'creating ...... HERE'
    respond_with Attachment.create(params[:attachment])
  end

  def edit
    respond_with Attachment.find(params[:id])
  end

  def update
    respond_with Attaachment.update(params[:id], params[:attachment])
  end

  def destroy
    respond_with Attachment.destroy(params[:id])
  end
end
