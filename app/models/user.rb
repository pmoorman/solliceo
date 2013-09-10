class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :image, :image_remote_url, :videoid, :phone, :linkedin, :twitter, :residence, :about_title, :about
  # attr_accessible :title, :body

  validates_attachment :image,
                          content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                          size: { less_than: 5.megabytes }

  #Checks that a default value for video (=0) is set
  validates :videoid, presence: true


  # Connects viewers to their respective users. 
  # Destroys dependent viewers when user is destroyed
  has_many :viewers, :dependent => :destroy
  has_attached_file :image, 
                      :styles => {medium: "200x200"},
                      :default_url => '/assets/images/rails.png'

  def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end

  def subdomain
    self.name.gsub(/[^A-Za-z_]/, '').downcase
  end

  def self.find_by_subdomain(subdomain)
    find { |user| return user if user.subdomain == subdomain }
  end
end
