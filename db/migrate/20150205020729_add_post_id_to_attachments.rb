class AddPostIdToAttachments < ActiveRecord::Migration
  def up
    add_column :attachments, :post_id, :integer
  end

  def down
    remove_column :attachments, :post_id
  end
end

