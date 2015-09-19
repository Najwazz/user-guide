class StaffController < ApplicationController

  layout "staff"
  before_filter :authorize_access, :except => [:index]
  
  def index
     menu
     @posts = Post.find(:all, 
      :order => 'posts.created_at DESC')
    render(:action => 'menu')
  end
  def menu 
     @posts = Post.find(:all, 
      :order => 'posts.created_at DESC')
  end
  def view_post
    @page_title ="view_post" 
    @post = Post.find(params[:id], :include=> [:author, :categories])
    render(:template => 'shared/view_post')
  end
  def login
    #@user = User.new
  end
  
  def logout
		session[:user_id] = nil
		flash[:notice] = "You are now logged out."
		redirect_to(:action => 'login')
  end
  def current_user
    @corrent_user ||=User.find(session[:user_id]) if session[:user_id]
  end
end
