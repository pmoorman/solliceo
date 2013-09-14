class PagesController < ApplicationController
	layout "dashboard", :only => :home
  def home
  end

  def about
  end

  def videowizard
  end
end
