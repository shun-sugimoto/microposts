module SessionsHelper
    def current_user
        # SELECT "users".* FROM "users" WHERE "users". "id"=user_id LIMIT 1
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
    end
   
    def store_location
        session[ :forwarding_url ] = request.url if request.get?
    end
end