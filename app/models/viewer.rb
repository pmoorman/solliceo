class Viewer < ActiveRecord::Base
  attr_accessible :company, :vacancy, :resume, :file_uploads, :file_uploads_attributes

  validates :company, :vacancy, :user, presence: true
  validates_attachment :resume, content_type: { content_type: %w(application/pdf resume/pdf) }

  # Connects viewers to their respective user
  belongs_to :user
  has_attached_file :resume
  has_many :file_uploads

  accepts_nested_attributes_for :file_uploads, :allow_destroy => true, reject_if: :all_blank
  validates_associated  :file_uploads
end
