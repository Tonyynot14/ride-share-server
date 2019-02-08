module API
  module V1
    class Drivers < Grape::API
      include API::V1::Defaults

      resource :drivers do
        desc "Return all riders"
        get "", root: :drivers do
          Driver.all
        end
      end

      desc "Return a driver"
      params do
        requires :id, type: String, desc: "ID of the
            driver"
      end
      get "driver/:id", root: :driver do
        Driver.where(id: permitted_params[:id]).first!
      end
     end
  end
end