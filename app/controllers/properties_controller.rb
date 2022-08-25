class PropertiesController < ApplicationController
    #before_filter :check_property_owner, :only => [:index, :show]

  #before_action :require_specific_role, only: %i[edit create update destroy new]
  before_action :authenticate_user!
  before_action :set_property, only: %i[ show edit update destroy ]
  def index
    @properties = Property.all
  end

  def show
  end

  def new
     @property = Property.new
  end

  def edit
  end

  def create
    @property = Property.new(property_params)
    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: "Property was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end 
    end    
  end 

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: "Property was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy
      respond_to do |format|
        format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      end
  end
  private
  
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:Property).permit(:name_property, :address_property, :latitude, :longitude, :photos)
  end

  #def require_specific_role
   # role = Role.find_by(user_type: params[:user][:roles])
    #current_user.roles << role
    #unless current_user.roles.first.user_type == 'Customer'
     # flash[:error] = "You must be Property Owner to access this section"
      #return redirect_to properties_path
    #end
  #end
    #def check_property_owner
      #if(my_condition to check if user type is customer)
         #{
          # return redirect_to user_dashboards_index_path 
         #}
end
