class AddPropertyToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookinggs, :property, null: false, foreign_key: true
  end
end
