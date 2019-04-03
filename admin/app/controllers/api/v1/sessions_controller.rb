module Api
  module V1
    class SessionsController < BaseController

      skip_before_action :require_login!, only: [:create]

      def create
        puts "1"
        puts params[:email]
        resource = Driver.find_for_database_authentication(:email => params[:email])
        resource ||= Driver.new
        puts "2"
        puts resource
        if resource.valid_password?(params[:password])
          auth_token = resource.generate_auth_token
          puts "3"
          render json: { auth_token: auth_token }

        else
          invalid_login_attempt
        end

      end

      def destroy
        resource = current_driver
        resource.invalidate_auth_token
        head :ok
      end

      private
      def invalid_login_attempt
        render json: { errors: [ { detail:"Error with your login or password" }]}, status: 401
      end
    end
  end
end

