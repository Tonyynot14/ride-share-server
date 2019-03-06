module API
  module V1
    class Rides < Grape::API
      include API::V1::Defaults

      resource :rides do
        desc "Return all riders"
        get "", root: :rides do
          Ride.all
        end
      end


      desc "Return a ride"
      params do
        requires :id, type: String, desc: "ID of the
            ride"
      end
      get "rides/:id", root: :ride do
        Ride.find(permitted_params[:id])
      end
    end
  end
end