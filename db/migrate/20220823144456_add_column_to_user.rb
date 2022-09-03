class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change

    ### Add the Phone To the User's table
    add_column :users, :phone_no, :string
  end
end
