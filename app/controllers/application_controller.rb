class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	 
				########## Checking the User loginTo Access the Functionality #######

	private 
	module SessionHelper
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
	end

				########## Dfine the Path for Customer and Property_Owner As Per the Requirement ##########
	
	def after_sign_in_path_for(resource) 
		current_user.roles.destroy_all
		role = Role.find_by(user_type: params[:user][:roles])
		current_user.roles << role
  		if current_user.roles.first.user_type == 'Customer'
    		return user_dashboards_index_path
  		elsif current_user.roles.first.user_type == 'Property_Owner'
    		return property_owner_dashboards_index_path
 			end
	end

				########## Passing the Parameters Of Devise Without Overriding The Registration and Session Controller #########

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :password, :account_no, :phone_no)}
	 devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :email, :password, :current_password)}
  end
end
