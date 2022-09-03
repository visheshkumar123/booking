class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      
      ##Define the Role of the User Either Customer Or Property_Owner
      t.string :user_type

      t.timestamps
    end
  end
end
