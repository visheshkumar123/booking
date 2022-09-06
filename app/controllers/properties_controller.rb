class PropertiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_property, only: %i[ show edit update destroy ]

  ###### Show All Properties In The Screen #######

  def index
    @properties=Property.all
  end

  ##### Show Particular Property #########

  def show
  end

  ########## Create the field / Instance For the New Property ##########

  def new
    if current_user.roles=='customer'
    @property = Property.new
    else  
    redirect_to bookinggs_path
    end
  end

  ######### Edit the Already Exist Property ###########

  def edit
  end

  ######### Create the New Property ###########

  def create
    @property = Property.new(property_params)
    @property.user_id=current_user.id
    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: "Property was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  ########### Update The Existing Property ###########

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: "Property was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  ########## Delete the Existing Property ###########
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
    end
  end

  private

  ########## Reduce the Redundancy of code calling of ID of Property ######

  def set_property
    @property = Property.find(params[:id])
  end

  ########## Permission the Parameters Used in the Class ##########

  def property_params
    params.require(:property).permit(:name_property, :address_property, :latitude, :longitude, :photos, :price, :avatar)
  end
end
