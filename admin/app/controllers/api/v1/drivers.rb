module API
  module V1
    class Drivers < Grape::API
      include API::V1::Defaults


        # desc "Return all riders"
        # params do
        #   requires :organization_id, type: String
        # end
        # get ":org_id/drivers", root: :driver do
        #   Driver.where(organization_id:  permitted_params[:organization_id])
        # end
        #
                desc "Return all riders"
                get "/drivers", root: :driver do
                  Driver.all
                end



      desc "Return a driver"
      params do
        requires :id, type: String
      end
      get "drivers/:id", root: :driver do
        Driver.where(id: permitted_params[:id]).first!
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
     end
  end
end