module SessionsHelper
  
  def authenticate
    deny_access unless signed_in?
  end
  
 def deny_access
   store_location
   redirect_to signin_path, :notice => "Please sign in to access this page."
 end  
 
 def tp_cost
   @athlete
 end

  


  def sign_in(user)
    session[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end
    
  def current_user=(user)
    @current_user = user
  end
  
  def current_user?(user)
      user == current_user
  end
  
  def current_user
    @current_user ||= User.find_by_id(session[:remember_token])
  end

  def creation_mode?
    current_user.creation_mode?
  end
  
  def help_tips?
  	current_user.help_tips?
  end

  def admin?
    current_user.admin?
  end

  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    session[:remember_token] = nil
    self.current_user = nil
  end
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page"
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  private
  
    def store_location
      session[:return_to] = request.fullpath
    end
    
    def clear_return_to
      session[:return_to] = nil
    end
      
    def user_from_remember_token 
      User.authenticate_with_salt(session[:remember_token])
    end
    
    def remember_token
    end

end
