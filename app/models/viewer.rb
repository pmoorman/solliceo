class Viewer < ActiveRecord::Base
  attr_accessible :company, :vacancy, :resume

  validates :company, presence: true
  validates :vacancy, presence: true
  validates_attachment :resume,
                            content_type: { content_type: ['resume/pdf'] }

  # Connects viewers to their respective user
  belongs_to :user
  validates :user_id, presence: true
  has_attached_file :resume
end
