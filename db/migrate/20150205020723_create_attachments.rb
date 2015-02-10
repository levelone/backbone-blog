class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :title
      t.string :file_type
      t.string :description

      t.timestamps
    end
  end
end
