module ApplicationHelper
  def customer_role_only
    current_user.roles.first.user_type == 'Customer'
  end

  def property_owner_role_only
    current_user.roles.first.user_type == 'Property_Owner'
  end
end
