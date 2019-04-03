module Api
  module V1
    class BaseController < ActionController::Base



      protect_from_forgery with: :null_session
      before_action :require_login!
      helper_method :person_driver_in?, :current_driver

      def user_driver_in?
        current_driver.present?
      end

      def require_login!
        return true if authenticate_token
        render json: { errors: [ { detail: "Access denied" } ] }, status: 401
      end

      def current_driver
        @_current_driver ||= authenticate_token
      end

      private
      def authenticate_token
        authenticate_with_http_token do |token, options|
          Driver.find_by(auth_token: token)
        end
      end

    end
  end
end