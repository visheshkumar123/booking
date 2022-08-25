class BookinggsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[ show edit update destroy ]
  def index
    @bookinggs = Bookingg.where(user_id: current_user.try(:id))
  end

  def show
  end

  def create
    #@bookingg = Bookingg.new(bookingg_params)
    @bookingg = current_userbookinggs.build(bookingg_params)
    respond_to do |format|
      if @bookingg.save
        format.html { redirect_to bookingg_url(@bookingg), notice: "Booking was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end 
    end
  end

  def update
    respond_to do |format|
      if @bookingg.update(bookingg_params)
        format.html { redirect_to bookingg_url(@bookingg), notice: "Booking was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def new
    @bookinggs = Bookingg.new
  end

  def destroy
    @bookingg.destroy
      respond_to do |format|
        format.html { redirect_to bookinggs_url, notice: "Booking was successfully destroyed." }
      end
  end 
  private
  def set_booking
    @bookingg = Bookingg.find(params[:id])
  end 
  
  def bookingg_params
    params.require(:bookingg).permit(:address, :property_no, :occupance, :date, :property_id)
  end    
end
