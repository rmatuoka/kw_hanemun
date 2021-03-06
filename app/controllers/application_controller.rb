# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  #Authlogic
    helper_method :current_user

    private

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
        
    def autentica
      if !current_user
        #@user = User.find_by_user
        @user = User.find(1)
        @info = @user.infos.first
        #redirect_to login_path
      else
        @user = current_user
        @info = @user.infos.first
      end
      
      load_carrinho
    end
    
    def load_box_package
      @packages_box = @user.packages.all
    end
    
    def load_carrinho
      @cart = Cart.all(:conditions => ['session_id = ? AND finalizado = 0', request.session_options[:id]])
    end
    
end
