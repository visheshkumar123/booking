class AddCol < ActiveRecord::Migration[7.0]
  def change
    rename_table :user_roles, :roles_users
  end
end
