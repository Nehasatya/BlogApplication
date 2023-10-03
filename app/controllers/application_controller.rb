class ApplicationController < ActionController::Base
   before_action :authenticate_user!

   rescue_from CanCan::AccessDenied do |exception|
     flash[:alert] = "Access Denied!!"
     redirect_to root_path
   end
  private

  # If your model is called User
  def after_sign_in_path_for(resource)
    session["user_return_to"] || root_path
  end
end
