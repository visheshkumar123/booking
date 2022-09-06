class ErrorsController < ApplicationController

  ###### Display action for the internal_error ########

  def internal_server_error
    render(:status => 500)
  end

  ###### Display action for the not_found ##########

  def not_found
    render(:status => 404)
  end

  ###### Display action for the unprocessable_entity ######

  def unprocessable_entity
    render(:status => 422)
  end
end
