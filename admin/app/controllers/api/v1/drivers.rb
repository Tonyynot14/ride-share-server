module Api
  module V1
    class Drivers < Grape::API
      include Api::V1::Defaults

      helpers SessionHelpers


      # before do
      #   require_login!
      # end

    desc "Return all drivers"
    get "/drivers", root: :driver do
      Driver.all
    end



      desc "Return a driver with a given id"
      params do
        requires :id, type: String, desc: "ID of driver"
      end
      get "drivers/:id", root: :driver do
        driver = Driver.find(permitted_params[:id])
        location_ids = LocationRelationship.where(driver_id: permitted_params[:id])
        locations = []
        location_ids.each do |id|
          locations.push(Location.where(id: id))
        end
        render json: {"driver": driver, "location": locations}
      end


      desc "Update a driver with a given id"
      params do
        requires :id, type: String, desc: "ID of driver"
      end
      put "drivers/:id" do
        driver = Driver.find(permitted_params[:id])
        driver.update(first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone],
                      email: params[:email], car_make: params[:car_make], car_model: params[:car_model],
                      car_color: params[:car_color], radius: params[:radius], is_active: params[:is_active])
        return Driver.find(permitted_params[:id])
      end


      desc "Delete a driver with a given id"
      params do
        requires :id, type: String, desc: "ID of driver"
      end
      delete "drivers/:id" do
        driver = Driver.find(permitted_params[:id])
        if driver.destroy != nil
          return { sucess:true }
        end
      end
    end
  end
end