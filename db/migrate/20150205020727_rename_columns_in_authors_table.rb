class RenameColumnsInAuthorsTable < ActiveRecord::Migration
  def up
    rename_column :authors, :fname, :first_name
    rename_column :authors, :lname, :last_name
  end

  def down
    rename_column :authors, :first_name, :fname
    rename_column :authors, :last_name, :lname
  end
end

