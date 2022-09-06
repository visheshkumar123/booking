class BookinggsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[ show edit update destroy ]

  ######### All Bookings #########

  def index
    #if current_user.roles=='Customer'
    @bookinggs = Bookingg.where(user_id: current_user.try(:id))
    #else
    #redirect_to properties_path
    #end
  end

  ######## Particular Bookings Details #########

  def show
  end

  ########  Edit Existing Bookings #########

  def edit
  end

  ########## Create the Insatnce For Creating Bookings ##########

  def new
    @bookingg = Bookingg.new
  end

  #########  Fill The Parameters To Create the Booking (New)  ######

  def create
    @bookingg = current_user.bookinggs.build(bookingg_params)
    respond_to do |format|
      if @bookingg.save!
        format.html { redirect_to bookingg_url(@bookingg), notice: "Booking was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  ######### Modify the Existing Bookings ###########

  def update
    respond_to do |format|
      if @bookingg.update(bookingg_params)
        format.html { redirect_to bookingg_url(@bookingg), notice: "Booking was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  ########## Delete the Particular Existing Bookings ##########

  def destroy
    @bookingg.destroy
    respond_to do |format|
      format.html { redirect_to bookinggs_url, notice: "Booking was successfully destroyed." }
    end
  end

  private

  ########### Calling of Find (ID) Whenever Need ########

  def set_booking
    @bookingg = Bookingg.find(params[:id])
  end

  ###### Passing The Required Parameters  ############

  def bookingg_params
    params.require(:bookingg).permit(:address, :property_no, :occupance, :date, :property_id)
  end
end
