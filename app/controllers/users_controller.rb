class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update]
  before_action :confirm_user, only:[:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'プロフィールを編集しました'
    else
      #保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
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

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:profile)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def confirm_user
    redirect_to root_path if @user != current_user
  end
end
