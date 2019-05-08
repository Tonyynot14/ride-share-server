module Api
  module V1
    class User < Grape::API
      include Api::V1::Defaults





      desc 'Create a user'
        params do
          requires :first_name, type: String
          requires :last_name, type: String
          requires :phone, type: String
        end
        post "user(json)", root: :Driver do
          Driver.create({first_name:params[:first_name],last_name:params[:last_name],phone:params[:phone]})
        end
      end

    end
  end
