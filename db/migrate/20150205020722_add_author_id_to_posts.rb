class AddAuthorIdToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :author_id, :integer
  end

  def down
    remove_column :posts, :author_id
  end
end

