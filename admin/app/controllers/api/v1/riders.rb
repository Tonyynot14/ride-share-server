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
      get "rider/:id", root: :rider do
        Rider.where(id: permitted_params[:id]).first!
      end

    end
  end
end