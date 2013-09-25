#require 'mandrill'
class JobapplicationMailer < ActionMailer::Base

  def job_apply(application, viewer)
    @application = application
    @viewer = viewer
    @viewer_url = viewer_url(@viewer)
    @file_url = @viewer.file_uploads.first.file.url
    mail(
        :to => application.emails,
        :subject => "Sollicitatie",
        :from => application.from,
        )
  end
end
