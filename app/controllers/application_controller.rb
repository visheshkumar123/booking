class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  ######### Setting the Standards according to the Locale Environment ######

  def default_url_options(options={})
    { :locale => I18n.locale }
  end

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

  ######### Callback for the Stamdard Of Access the Block Of Code ###########

  def set_locale
    I18n.locale = (params[:locale] if params[:locale].present?) || cookies[:locale] || I18n.default_locale || 'en'
    cookies[:locale] = I18n.locale if cookies[:locale] != I18n.locale
  end

  ########## Dfine the Path for Customer and Property_Owner As Per the Requirement ##########

  def after_sign_in_path_for(resource)
    if current_user.roles.first.user_type == 'Customer'
      return user_dashboards_index_path
    elsif current_user.roles.first.user_type == 'Property_Owner'
      return property_owner_dashboards_index_path
    end
  end

  ########## Passing the Parameters Of Devise Without Overriding The Registration and Session Controller #########

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :password, :account_no, :phone_no,:role_ids, :password_confirmation)}
  end
end
