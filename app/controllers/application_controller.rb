class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?      

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def require_user
      if !logged_in?
        flash[:alert] = "Voce precisa estar logado para fazer essa ação"
        redirect_to login_path
      end
    end
end

#Mesmo sistema de login que eu usei no Blogsfera padrão
