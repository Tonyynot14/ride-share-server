class AddAuthenticationTokenToDrivers < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :authentication_token, :string, limit: 30
    add_index :drivers, :authentication_token, unique: true
  end
end
