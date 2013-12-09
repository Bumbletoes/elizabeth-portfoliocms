class Admin::AuthenticateController < AdminController
  protect_from_forgery
  helper_method :current_user, :show_sign_in
  skip_before_filter :require_login

  def sign_in
  	@user = User.new
  end

  def login
    username_or_email = params[:user][:username]
    password = params[:user][:password]

    email=username_or_email
    user = User.authenticate_by_email(email, password)
    
    if user
      session[:user_id] = user.id
      redirect_to admin_url
    else
      flash.now[:error] = 'Unknown user. Please check your username and password.'
      render :action => "admin/sign_in"
    end
  end
end
