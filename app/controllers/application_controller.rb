class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :sanitize_devise_params, if: :devise_controller?
    before_action :authenticate_user!

    #before_action :require_login

    def sanitize_devise_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sign_up_code])
    end

    #def require_login
        #unless logged_in?
           # flash[:danger] = "Tu dois être enregistré pour accéder à cette page, petit malin ;)"
           # redirect_to login_path # halts request cycle
       # end
    #end

end
