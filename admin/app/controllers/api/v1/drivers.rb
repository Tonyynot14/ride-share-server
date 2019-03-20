module API
  module V1
    class Drivers < Grape::API
      include API::V1::Defaults



    desc "Return all riders"
    get "/drivers", root: :driver do
      Driver.all
    end



      desc "Return a driver"
      params do
        requires :id, type: String
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

     #
     #  desc "Return a driver"
     #  params do
     #    requires :id, type: String
     #    requires :organization_id, type: String
     #  end
     #  get "drivers/:id", root: :driver do
     #    Driver.where(organization_id:  permitted_params[:organization_id], id: permitted_params[:id]).first!
     #  end
     #

      desc "Update a driver"
      params do
        requires :id, type: String
      end
      put "drivers/:id" do
        driver = Driver.find(permitted_params[:id])
        driver.update(first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone],
                      email: params[:email], car_make: params[:car_make], car_model: params[:car_model],
                      car_color: params[:car_color], radius: params[:radius], is_active: params[:is_active])
        return Driver.find(permitted_params[:id])
      end


      desc "Delete a driver"
      params do
        requires :id, type: String
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