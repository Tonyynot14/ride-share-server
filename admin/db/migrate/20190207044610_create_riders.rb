class CreateRiders < ActiveRecord::Migration[5.2]

  def change
    create_table :riders do |t|
      t.belongs_to :organization
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
