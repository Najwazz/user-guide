class SessionsController < ApplicationController

  layout "application"
  
  def create
    @page_title= "SignIn"
    user =User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(:controller=>'staff',:action => 'menu', :notice=> "Logged in!")
    else
      flash[:notice] =  "Email or password is invalid"
      redirect_to(:controller=>'sessions',:action => 'new')
    end
   end

  def destroy
    session[:user_id]=nil
    redirect_to(:controller=>'sessions',:action => 'new', :notice=> "Logged out!")
    flash[:notice] =  "Logged out!"
  end
  def current_user
    @corrent_user ||=User.find(session[:user_id]) if session[:user_id]
  end

end