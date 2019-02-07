class CreateRiders < ActiveRecord::Migration[5.2]
  def change
    create_table :riders do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :tokens
      t.string :address

      t.timestamps
    end
  end
end
