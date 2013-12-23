class AdminController < ApplicationController
  before_filter :require_login
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      redirect_to admin_sign_in_url
    end
  end

  def index
   # testGallery = Gallery.new
   # testGallery.name = 'Default Gallery'
   # testGallery.description = "This is a test gallery."
   # testGallery.save
    @galleries = Gallery.all
  end
end
