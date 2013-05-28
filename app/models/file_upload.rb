class FileUpload < ActiveRecord::Base
  belongs_to :viewer
  # validates_presence_of :viewer
  validates_presence_of :name

  attr_accessible :file, :name, :viewer_id, :viewer
  has_attached_file :file, 
  	:url => "/uploaded_files/:viewer_id/:basename.:extension",
  	:path => ":rails_root/public/uploaded_files/:viewer_id/:basename.:extension"
  validates_attachment_presence :file
  validates_attachment :file, content_type: { content_type: 
  	[  'application/pdf', 
  		'resume/pdf', 
  		'application/msword',
  		'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  		'application/vnd.ms-powerpoint',
  		'application/vnd.openxmlformats-officedocument.presentationml.presentation',
      'application/rtf',
      'text/plain'
  	] 
  }
  #other mime types can be found here : http://www.hansenb.pdx.edu/DMKB/dict/tutorials/mime_typ.php

end
