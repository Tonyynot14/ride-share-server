class RiderSerializer < ActiveModel::Serializer

  attributes :id, :first_name, :last_name, :phone,
             :email, :tokens, :address
end