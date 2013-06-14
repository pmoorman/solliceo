class ApplicationMailer < ActionMailer::Base
  def template
    mail
  end

  def new_application(application)
    @application = application
    mail(:sender => @application.from, :to => @application.emails_clean, :subject => @application.subject)
  end
end
