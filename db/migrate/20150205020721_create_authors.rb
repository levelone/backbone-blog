class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :age
      t.string :fname
      t.string :lname

      t.timestamps
    end
  end
end
