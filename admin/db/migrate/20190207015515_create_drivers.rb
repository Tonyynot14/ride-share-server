class CreateDrivers < ActiveRecord::Migration[5.2]


  def change
    create_table :drivers do |t|
      t.belongs_to :organization
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :car_make
      t.string :car_model
      t.string :car_color
      t.string :address

      t.timestamps
    end
  end
end
