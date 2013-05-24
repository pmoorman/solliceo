class RemoveFileAttachmentFromViwer < ActiveRecord::Migration
  def up
  	remove_column :viewers, :resume_file_name
    remove_column :viewers, :resume_content_type
    remove_column :viewers, :resume_file_size
    remove_column :viewers, :resume_updated_at
  end

  def down
  end
end
