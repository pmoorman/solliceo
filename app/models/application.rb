class Application
  # make our db-less model behave like regular ActiveRecord
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  # templates
  TEXT_TEMPLATE = 'Schrijf hier je bericht. Dit wordt zichtbaar in de sollicitatie-email'
  HTML_TEMPLATE = '<h1>Resume</h1>Please, enter your text here'

  # attributes and validations
  attr_accessor :emails, :subject, :text_body, :html_body, :from
  validates_presence_of :emails, :subject, :from
  validates :emails, with: :check_emails_format
  validates :text_body, with: :check_body_presence

  # accept params hash in Application.new
  def initialize(user, attributes = {})
    self.from = user.email
    self.subject = "#{user.name} resume"
    self.text_body = TEXT_TEMPLATE
    self.html_body = HTML_TEMPLATE
    self.emails = ''
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def check_emails_format
    # check if all emails have correct format
    if emails_clean.map{|e| e =~ /[^ @]+@[^ @]+\.[^ @]+/}.all?
      true
    else
      errors.add(:emails, 'are incorrect')
    end
  end

  def check_body_presence
    # we need either body present
    if self.text_body.present? || self.html_body.present?
      true
    else
      errors.add(:text_body, 'is missing')
      errors.add(:html_body, 'is missing')
    end
  end

  def emails_clean
    emails.split(',').map(&:strip)
  end

  # persisted always false
  def persisted?
    false
  end
end
