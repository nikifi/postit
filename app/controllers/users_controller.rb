class UsersController < ApplicationController

  def new
    @user = User.new

  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Your account is created'
      redirect_to root_path
    else
      render :new

    end

  end

  def show
    #binding.pry

    #@user = User.find_by(username: current_user.username)
    #@userid = User.find_by(id: current_user.id)
    @user = current_user
    @userpost = Post.where("user_id = ?", current_user.id)

  end

  def user_params
    params.require(:user).permit(:username, :password)

  end


end