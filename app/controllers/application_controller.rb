class ApplicationController < ActionController::Base
    
  # def after_log_in_path_for(resource)
  #   share_path 'shares#index'
  # end
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

end


