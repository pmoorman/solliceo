class FileUpload < ActiveRecord::Base
  belongs_to :viewer
  validates_presence_of :viewer, :name, :file

  attr_accessible :file, :name, :viewer_id, :viewer
  has_attached_file :file, 
  	:url => "/uploaded_files/:viewer_id/:basename.:extension",
  	:path => ":rails_root/public/uploaded_files/:viewer_id/:basename.:extension"
  validates_attachment_presence :file
  validates_attachment :file, content_type: { content_type: %w(application/pdf resume/pdf) }
end
