class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def unauthorized!(admin = false)
    session[:return_to] = url_for(params) if !request.xhr?
    Rails.logger.info "Saved return information: #{session[:return_to]}"
    redirect_to new_session_path
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def login_required
    unauthorized! unless logged_in?
  end

  def logout_required
    redirect_to root_path if logged_in?
  end

end
