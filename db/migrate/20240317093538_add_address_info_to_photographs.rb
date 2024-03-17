class AddAddressInfoToPhotographs < ActiveRecord::Migration[7.0]
  def change
    add_column :photographs, :address, :string
    add_column :photographs, :latitude, :float
    add_column :photographs, :longitude, :float
  end
end
