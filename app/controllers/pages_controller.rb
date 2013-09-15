class PagesController < ApplicationController
	layout "salespage", :only => :home
  def home
  end

  def about
  end

  def videowizard
  end
end
