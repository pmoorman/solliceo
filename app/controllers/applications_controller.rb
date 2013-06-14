class ApplicationsController < ApplicationController
  def new
    @application = Application.new(
        from: current_user.email,
        subject: "#{current_user.name} resume",
        text_body: ApplicationMailer.template().text_part.body.raw_source,
        html_body: ApplicationMailer.template().html_part.body.raw_source
    )
  end

  def create
    @application = Application.new(params[:application])
    if @application.valid? && ApplicationMailer.new_application(@application).deliver
      redirect_to(params[:return_url], notice: 'Your application sent successfully!')
    else
      render 'new'
    end
  end
end
