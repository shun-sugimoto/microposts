class RelationshipsController < ApplicationController
    before_action :logged_in_user
    
    def create
        @user = User.find(params[:followed_id])
        current_user.follow(@user)
    end
    
    def destroy
        @user = current_user.following_relationships.find(params[:id]).followed
        current_user.unfollow(@user)
    end


  # あるユーザがフォローしている一覧を表示する
  def following
      @user = User.find(params[:id])
      @title = "Follower"
      @users =  @user.following_users
      render 'users/show_follower'
  end

  # あるユーザがフォローされている一覧を表示する
  def follower
      @user = User.find(params[:id])
      @title = "Followed"
      @users =  @user.follower_users
      render 'users/show_follower'
  end
end
