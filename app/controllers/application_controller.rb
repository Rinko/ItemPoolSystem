class ApplicationController < ActionController::Base
  before_filter :user_authorize
  protect_from_forgery

  protected

  def user_authorize
    unless Student.find_by_id(session[:user_id]) || Administrator.find_by_id(session[:user_id])
      redirect_to login_url, :alert => "please login."
    end
  end
  def admin_authorize
    unless Administrator.find_by_id(session[:user_id]) && session[:user_type] == "Administrator"
      redirect_to login_url, :alert => "please login."
    end
  end
end
