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


        desc "Accept a ride"
        params do
          requires :ride_id, type: String, desc: "ID of the
                ride"
          requires :driver_id, type: String, desc: "ID of the
                driver"
        end
        post "rides/:ride_id/accept/:driver_id" do
          ride = Ride.find(permitted_params[:ride_id])
          ride.update(driver_id: permitted_params[:driver_id], status: "scheduled")
          return Ride.find(permitted_params[:ride_id])
        end


        desc "Complete a ride"
        params do
          requires :ride_id, type: String, desc: "ID of the
                  ride"
          requires :driver_id, type: String, desc: "ID of the
                  driver"
        end
        post "rides/:ride_id/complete/:driver_id" do
          ride = Ride.find(permitted_params[:ride_id])
          ride.update(status: "completed")
          Ride.find(permitted_params[:ride_id])
        end

      desc "Cancel a ride"
      params do
        requires :ride_id, type: String, desc: "ID of the
                  ride"
        requires :driver_id, type: String, desc: "ID of the
                  driver"
      end
      post "rides/:ride_id/cancel/:driver_id" do
        ride = Ride.find(permitted_params[:ride_id])
        ride.update(status: "canceled")
        Ride.find(permitted_params[:ride_id])
      end


    end
  end
end