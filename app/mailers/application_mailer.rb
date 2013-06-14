require 'mandrill'
class ApplicationMailer
  def self.new_application(application)
    begin
      mandrill = Mandrill::API.new '0_ToZyLUVMS4wMtvF0XzSA'
      message = {
          "auto_text" => true,
          "from_email" => application.from,
          "subject" => application.subject,
          "to" => application.emails_clean.map{|email| {email: email}},
          "html" => application.html_body.present? ? application.html_body : '',
          "text" => application.text_body.present? ? application.text_body : ''
      }
      async = false
      ip_pool = "Main Pool"
      result = mandrill.messages.send message, async, ip_pool
      result.map {|r| "#{r['email']}: #{r['status']}"}.to_sentence
    rescue Mandrill::Error => e
      # Mandrill errors are thrown as exceptions
      puts "A mandrill error occurred: #{e.class} - #{e.message}"
      # A mandrill error occurred: Mandrill::InvalidKeyError - Invalid API key
      raise
    end
  end
end
