class Viewer < ActiveRecord::Base
  attr_accessible :company, :vacancy, :resume

  validates :company, :vacancy, :user, presence: true
  validates_attachment :resume, content_type: { content_type: %w(application/pdf resume/pdf) }

  # Connects viewers to their respective user
  belongs_to :user
  has_attached_file :resume
end
