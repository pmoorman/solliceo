class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.attachment :file
      t.integer :viewer_id
      t.string :name

      t.datetime :created_at
    end
  end
end
