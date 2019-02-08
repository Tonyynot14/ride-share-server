class DriverSerializer < ActiveModel::Serializer

  attributes :id, :first_name, :last_name, :phone,
             :email, :address, :car_make, :car_model, :car_color
end