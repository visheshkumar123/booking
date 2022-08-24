class CreateBookinggs < ActiveRecord::Migration[7.0]
  def change
    create_table :bookinggs do |t|
      t.string :address
      t.string :property_no
      t.string :occupance
      t.datetime :date
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
