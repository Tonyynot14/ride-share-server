class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.belongs_to :organization
      t.belongs_to :rider
      t.belongs_to :driver
      t.timestamp :pick_up_time
      t.string :start_street
      t.string :start_city
      t.string :start_state
      t.string :start_zip
      t.string :end_street
      t.string :end_city
      t.string :end_state
      t.string :end_zip
      t.text :reason
      t.string :status, default: 'requested'

      t.timestamps
    end
  end
end
