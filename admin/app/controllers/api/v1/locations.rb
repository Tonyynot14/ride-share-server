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



      desc "delete a location"
      params do
        requires :id, type: String, desc: "ID of location"
      end
      delete 'locations/:id' do
        location = Location.find(permitted_params[:id])
        if location.destroy != nil
          return { sucess:true }
        end
      end


      desc "put a location"
      params do
        requires :id, type: String, desc: "ID of location"
      end
      put 'locations/:id' do
        oldLocation = Location.find(permitted_params[:id])
        oldLocation.update(street: params[:street], city: params[:city], state: params[:state], zip: params[:zip])
        return Location.find(permitted_params[:id])
      end
    end
  end
end