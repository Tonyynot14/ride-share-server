module API
  module V1
    class Locations < Grape::API
      include API::V1::Defaults

      resource :locations do
        desc "Return all locations"
          get "", root: :locations do
            Location.all
          end
      end


      desc "Return a location"
      params do
        requires :id, type: String, desc: "ID of the
            location"
      end
      get "locations/:id", root: :location do
        Location.find(permitted_params[:id])
      end



      desc "Return all locations for a given driver"
      params do
        requires :id, type: String, desc: "ID of the
            driver"
      end
      get "locations/drivers/:id", root: :location do
        location_ids = LocationRelationship.where(driver_id: params[:id]).ids
        locations = Location.where(id: location_ids)
        return locations
      end




      desc "post a location"
      post "locations" do
        Location.create(street: params[:street], city: params[:city], state: params[:state], zip: params[:zip])
      end



      desc "post a location from a driver"
      params do
        requires :id, type: String, desc: "Drivers id"
      end
      post "locations/drivers/:id" do
        location = Location.create(street: params[:street], city: params[:city], state: params[:state], zip: params[:zip])
        LocationRelationship.create(location_id: location.id, driver_id: permitted_params[:id])
        return location
      end





      desc "delete a location outright"
      params do
        requires :id, type: String, desc: "ID of location"
      end
      delete 'locations/:id' do
        location = Location.find(permitted_params[:id])
        if location != nil
            location.destroy
            return { sucess:true }
        end
      end




      desc "delete a location from a driver"
      params do
        requires :id, type: String, desc: "ID of location"
      end
      delete 'locations/:id/drivers/:driver_id' do
        location = Location.find(permitted_params[:id])
        if location != nil
          LocationRelationship.find_by(location_id: permitted_params[:id], driver_id: params[:driver_id]).destroy
          if LocationRelationship.where(location: permitted_params[:id]).count == 0
            location.destroy
          end
          return { sucess:true }
        end
      end





      desc "put a location from a driver"
      params do
        requires :id, type: String, desc: "ID of location"
        requires :driver_id, type: String, desc: "ID of location"
      end
      put 'locations/:id/drivers/:driver_id' do
        old_location = Location.find(permitted_params[:id])
        if LocationRelationship.where(location_id: permitted_params[:id]).count > 1
          new_location = Location.create(street: params[:street], city: params[:city], state: params[:state], zip: params[:zip])
          LocationRelationship.create(location_id: new_location.id, driver_id: permitted_params[:driver_id])
          # LocationRelationship.find_by(location_id: permitted_params[:id], driver_id: driver)
        else
          old_location.update(street: params[:street], city: params[:city], state: params[:state], zip: params[:zip])
        end

        return new_location
      end




      desc "put a location"
      params do
        requires :id, type: String, desc: "ID of location"
      end
      put 'locations/:id' do
        old_location = Location.find(permitted_params[:id])
        old_location.update(street: params[:street], city: params[:city], state: params[:state], zip: params[:zip])
        return Location.find(permitted_params[:id])
      end
    end
  end
end
