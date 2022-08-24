class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name_property
      t.string :address_property
      t.string :latitude
      t.string :longitude
      t.string :photos
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
