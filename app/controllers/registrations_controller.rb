class RegistrationsController < Devise::RegistrationsController

  before_filter :restrict_access, :only => [:new]

  def restrict_access
    redirect_to new_user_session_path, :alert => 'Access denied!'
  end

end
