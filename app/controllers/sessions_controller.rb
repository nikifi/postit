class SessionsController < ApplicationController

def new

end

def create
  
  user = User.where(username: params[:username]).first
  if (user && user.authenticate(params[:password]))
    session[:user_id] = user.username
    flash[:notice] = "You have logged in successfully"
    redirect_to root_path
  else
    flash[:notce] = "There is something wrong with your login info"
    redirect_to '/login'

  end
 
end

def destroy 
  session[:user_id] = nil
  flash[:notice] = "You've logged out successfully"
  redirect_to '/login'
end

end