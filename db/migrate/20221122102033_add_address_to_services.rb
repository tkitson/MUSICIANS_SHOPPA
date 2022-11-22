class AddAddressToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :address, :string
  end
end
