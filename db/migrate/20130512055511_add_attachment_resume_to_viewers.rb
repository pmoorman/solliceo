class AddAttachmentResumeToViewers < ActiveRecord::Migration
  def self.up
    change_table :viewers do |t|
      t.attachment :resume
    end
  end

  def self.down
    drop_attached_file :viewers, :resume
  end
end
