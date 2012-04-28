class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user  
    
  private  
  
    def current_user  
      @current_user ||= User.find(session[:user_id]) if session[:user_id]  
    end 
    
    def user_required
      redirect_to login_url unless current_user
    end  

    def admin_required
      user_required
      redirect_to root_url unless current_user.admin?
    end
end
