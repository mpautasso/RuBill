module SessionsHelper

  def deny_access
    store_location
    redirect_to new_user_session_path, :alert => t(:sign_in_advice)
  end

private
    
    def store_location
      session[:return_to] = request.fullpath
    end

end
