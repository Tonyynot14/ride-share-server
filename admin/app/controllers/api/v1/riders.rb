module API
  module V1
    class Riders < Grape::API
      include API::V1::Defaults

      resource :riders do
        desc "Return all riders"
        get "", root: :riders do
          Rider.all
        end
      end


      desc "Return a rider"
      params do
        requires :id, type: String, desc: "ID of the
            rider"
      end
      get "riders/:id", root: :rider do
        rider = Rider.find(permitted_params[:id])
        location_ids = LocationRelationship.where(driver_id: permitted_params[:id])
        locations = []
        location_ids.each do |id|
          locations.push(Location.where(id: id))
        end
        render json: {"rider": rider, "locations": locations}
      end

    end
  end
end