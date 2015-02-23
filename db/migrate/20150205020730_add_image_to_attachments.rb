class AddImageToAttachments < ActiveRecord::Migration
  def up
    add_column :attachments, :image, :string
  end

  def down
    remove_column :attachments, :image
  end
end

