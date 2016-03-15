class FollowerController < ApplicationController
    
    def show
        @following_user = following(current_user)
    end
end
