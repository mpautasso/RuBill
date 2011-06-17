module SessionsHelper

#  def signed_in?
#    current_user
#  end
  
  def deny_access
    store_location
   # redirect_to signin_path, :alert => "Please sign in to access this page."
#   redirect_to root_path, :alert => "Please sign in to access this page."
   redirect_to new_user_session_path, :alert => "Please sign in to access this page."
  end

private
    
    def store_location
      session[:return_to] = request.fullpath
    end

end
