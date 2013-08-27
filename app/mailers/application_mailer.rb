require 'mandrill'
class ApplicationMailer
  def self.new_application(application)
    begin
      mandrill = Mandrill::API.new '0_ToZyLUVMS4wMtvF0XzSA'
      content = [{:name => 'company_name', :content => application.from}, {:name => 'user_email', :content => application.from}, {:name => 'body_text', :content => application.from}, {:name => 'application_url', :content => application.from},{:name => 'cv_url', :content => application.from},]
      params = {
        "template_name" => "new_application",
        "template_content" => [
            {
                "name" => "company_name",
                "content" => application.from
            }
        ]
      }
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
      result = mandrill.messages.send_template params, message, async, ip_pool
      result.map {|r| "#{r['email']}: #{r['status']}"}.to_sentence
    rescue Mandrill::Error => e
      # Mandrill errors are thrown as exceptions
      puts "A mandrill error occurred: #{e.class} - #{e.message}"
      # A mandrill error occurred: Mandrill::InvalidKeyError - Invalid API key
      raise
    end
  end
end
