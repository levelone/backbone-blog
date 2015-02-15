class RenameTagNameToNameInTagsTable < ActiveRecord::Migration
  def up
    rename_column :tags, :tag_name, :name
  end

  def down
    rename_column :tags, :name, :tag_name
  end
end

