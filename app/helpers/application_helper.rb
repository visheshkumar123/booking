module ApplicationHelper

  ###### For HTML validation Use EveryTime's ##########

  ####### Access for Customer's functionality ##########
  def customer_role_only
    current_user.roles.first.user_type == 'Customer'
  end

  ####### Access for Property_Owner's functionality ######### 
  def property_owner_role_only
    current_user.roles.first.user_type == 'Property_Owner'
  end
end
