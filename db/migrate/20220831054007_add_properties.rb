class AddProperties < ActiveRecord::Migration[7.0]
  def change
    change_column :properties, :latitude,  :decimal  
    change_column :properties, :longitude,  :decimal
  end
end
