class RidersController < ApplicationController


  def new
    @rider = Rider.new
  end


  def show
    @rider = Rider.find(params[:id])
  end

  def index
    @riders = Rider.all
  end



  def create
    @rider = Rider.new(rider_params)

    if @rider.save
      redirect_to @rider
    else
      render 'new'
      end
  end

  def edit
    @rider = Rider.find(params[:id])
  end

  def update
    @rider = Rider.find(params[:id])

    if @rider.update(rider_params)
      redirect_to @rider
    else
      render 'edit'
    end
  end

  def destroy
    @rider = Rider.find(params[:id])
    @rider.destroy

    redirect_to riders_path
  end




  private
  def rider_params
    params.require(:rider).permit(:first_name, :last_name, :phone, :email, :tokens, :address)
  end

end
