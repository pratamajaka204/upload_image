class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	rescue_from CanCan::AccessDenied do |exception|
	  
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Cannot Procced this action , you dont have an access' }
    end
	  
	end

	protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up)  { |u| u.permit(  :email,:password, :password_confirmation, roles: []) }
	end
end
