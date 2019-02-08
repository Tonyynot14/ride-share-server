class RideSerializer < ActiveModel::Serializer

  attributes :rider_id, :driver_id, :pick_up_time, :start_street, :start_city,
             :start_state, :start_zip, :end_street, :end_city, :end_state, :end_zip, :reason, :status
end