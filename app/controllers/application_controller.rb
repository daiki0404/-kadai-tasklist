class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper

  private
  
  def require_user_loged_in
    unless logged_in?
      redirect_to login_path
    end
  end
end
