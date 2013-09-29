class ApplicationsController < ApplicationController
  def new
    @application = Application.new(current_user)
  end

  def create
    @application = Application.new(current_user, params[:application])
    @viewer = Viewer.find(params[:viewer])
    if @application.valid?
      JobapplicationMailer.job_apply(@application, @viewer).deliver
      respond_to do |format|
        format.html { redirect_to(params[:return_url], notice: 'Je sollicitatie is succesvol verstuurd!') }
        format.js { render inline: "<h3>Je sollicitatie is succesvol verstuurd!</h3>".html_safe, locals: {application: Application.new(current_user)}}
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js { render partial: 'form', locals: {application: @application} }
      end
    end
  end
end
