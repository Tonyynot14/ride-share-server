module API
  module V1
    class Base < Grape::API
      mount API::V1::Drivers
      mount API::V1::Riders

    end
  end
end