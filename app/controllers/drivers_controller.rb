class DriversController < ApplicationController

  def new
    @driver = Driver.new
  end

  def show
    @driver = Driver.find(params[:id])
    @location_ids = LocationRelationship.where(driver_id: params[:id]).ids
    @locations = Location.where(id: @location_ids)

  end

  def index
    @drivers = Driver.all
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to @driver
    else
      render 'new'
    end
  end


  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])

    if @driver.update(driver_params)
      redirect_to @driver
    else
      render 'edit'
    end
  end




  def destroy
    @driver = Driver.find(params[:id])
    @driver.destroy

    redirect_to drivers_path
  end

  private
  def driver_params
    params.require(:driver).permit(:first_name, :last_name, :phone, :email, :address, :car_make, :car_model, :car_color)
  end
end
