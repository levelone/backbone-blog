class AddPostIdToComments < ActiveRecord::Migration
  def up
    add_column :comments, :post_id, :integer
  end

  def down
    remove_column :comments, :post_id
  end
end

