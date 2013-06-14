class ApplicationsController < ApplicationController
  def new
    @application = Application.new(current_user)
  end

  def create
    @application = Application.new(current_user, params[:application])
    if @application.valid? && (result = ApplicationMailer.new_application(@application))
      respond_to do |format|
        format.html { redirect_to(params[:return_url], notice: 'Your application sent successfully!') }
        format.js { render inline: "<h3>Results</h3>#{result}".html_safe, locals: {application: Application.new(current_user)}}
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js { render partial: 'form', locals: {application: @application} }
      end
    end
  end
end
