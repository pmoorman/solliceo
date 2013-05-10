class Viewer < ActiveRecord::Base
  attr_accessible :company, :vacancy

  validates :company, presence: true
  validates :vacancy, presence: true

  # Connects viewers to their respective user
  belongs_to :user
end
