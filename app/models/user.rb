class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :image
  # attr_accessible :title, :body

  validates_attachment :image,
                          content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                          size: { less_than: 5.megabytes }

  # Connects viewers to their respective users. 
  # Destroys dependent viewers when user is destroyed
  has_many :viewers, :dependent => :destroy
  has_attached_file :image, 
                      :styles => {medium: "200x200"},
                      :default_url => '/assets/images/rails.png'
end
