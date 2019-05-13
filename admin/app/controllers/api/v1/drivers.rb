module Api
  module V1
    class Drivers < Grape::API
      include Api::V1::Defaults

      helpers SessionHelpers

      #Create a driver by suppling json with required params organization_id,email,password,first_name
      #last_name, and phone

      desc "Create a Driver"
      params do
        requires :email , type:String
        requires :password, type:String
        requires :first_name, type: String
        requires :last_name, type: String
        requires :phone, type: String
        requires :organization_id, type: Integer
      end
      post "drivers(json)" do
        driver = Driver.new({organization_id: params[:organization_id], email: params[:email],password: params[:password],first_name: params[:first_name],last_name: params[:last_name],phone: params[:phone]})
        if driver.save
          status 200
          render json: driver
        #Return bad request error code and error
        else
          status 400
          render json: driver.errors

        end
      end

        ##Namespace so only have to authorize on methods that follow
      namespace do
        before do
          error!('Unauthorized', 401) unless require_login!
        end


        # desc "Return all drivers"
        # get "/drivers/all", root: :driver do
        #   Driver.all
        # end

        desc "Return a driver with a given id"
        params do
        # requires :id, type: String, desc: "ID of driver"
        end
        get "drivers", root: :driver do
          driver = current_driver
          location_ids = LocationRelationship.where(driver_id: current_driver.id)
          locations = []
          location_ids.each do |id|
          locations.push(Location.where(id: id))
          end
          return driver
          #render json: {"driver": driver, "location": locations}
        end


        desc "Update a driver with a given id"
        params do
        end
        put "drivers" do
          driver = current_driver
          driver.update(first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone],
                        email: params[:email], car_make: params[:car_make], car_model: params[:car_model],
                        car_color: params[:car_color], radius: params[:radius], is_active: params[:is_active])
          return current_driver
        end


        desc "Delete a driver with a given id"
        params do
        end
        delete "drivers" do
          driver = current_driver
          if driver.destroy != nil
            return { sucess:true }
          end
        end
      end
    end
  end
end
