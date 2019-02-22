class DriverSerializer < ActiveModel::Serializer

  attributes :organization_id, :id, :first_name, :last_name, :phone,
             :email, :address, :car_make, :car_model, :car_color
end