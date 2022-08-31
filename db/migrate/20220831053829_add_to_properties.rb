class AddToProperties < ActiveRecord::Migration[7.0]
  def change
    change_column :properties, :price,  :decimal  
  end
end
