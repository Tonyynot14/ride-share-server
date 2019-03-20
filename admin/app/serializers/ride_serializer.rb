class RideSerializer < ActiveModel::Serializer

  attributes :organization_id, :rider_id, :driver_id, :pick_up_time, :start_location, :end_location,  :reason, :status

end