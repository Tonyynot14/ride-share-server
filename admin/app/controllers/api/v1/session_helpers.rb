module Api
  module V1
      module SessionHelpers


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
          Token.authenticate_with_http_token do |token, options|
            Driver.find_by(auth_token: token)
          end
        end
      end

  end
end

