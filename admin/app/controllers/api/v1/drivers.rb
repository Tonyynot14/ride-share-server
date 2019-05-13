module Api
  module V1
    class Drivers < Grape::API
      include Api::V1::Defaults

      helpers SessionHelpers


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

      desc "Create Application from App"
      params do
        requires :car_make, type: String, desc: " Car Manufactor of Driver"
        requires :car_model, type: String, desc: " Car Model of Driver"
        requires :car_year, type: Integer, desc: " Car Year of Driver"
        requires :car_color, type: String, desc: " Car Color of driver"
        requires :car_plate, type: String, desc: " Car plate of driver"
        requires :insurance_provider, type: String, desc: " Insurance Provider for driver"
        requires :insurance_start, type: DateTime, desc: " Insurance start date"
        requires :insurance_stop, type: DateTime, desc: " Insurance start date"
      end
      post "drivers/application" do
        driver = current_driver
          driver.update(car_make: params[:car_make], car_model: params[:car_model],
                        car_year: params[:car_year], car_color: params[:car_color],
                        car_plate: params[:car_plate], insurance_provider: params[:insurance_provider],
                        insurance_start: params[:insurance_start], insurance_stop: params[:insurance_stop],
                        application_state: "pending")

      end


    end
  end
end
