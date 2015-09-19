class PostsController < ApplicationController

  layout 'staff'
  before_filter :authorize_access
   
  def index
    list
    render :action => 'list'
  end


  def list
    page = (params[:page] || 1).to_i
    items_per_page = 12
    offset = (page - 1) * items_per_page
    post_count = Post.count()
    @posts = Post.find(:all, :limit => items_per_page, :offset => offset)
  end

  def show
    @post = Post.find(params[:id])
    @all_categories = Category.find(:all, :order => 'name ASC')
   #render(:template => 'shared/view_post', :layout => 'application')
  end
  alias :view_post :show

  def new
    @post = Post.new
    @user_list = get_user_list
    @all_categories = get_all_categories
  end

  def create
    post_params = params[:post]
    @all_categories = get_all_categories
    checked_categories = get_categories_from(params[:categories])
    removed_categories = @all_categories - checked_categories
    @post = Post.new(post_params)
    @post.author = User.find(session[:user_id]) if session[:user_id]
    if @post.save
      checked_categories.each {|cat| @post.categories << cat if !@post.categories.include?(cat) }
      removed_categories.each {|cat| @post.categories.delete(cat) if @post.categories.include?(cat) }
      flash[:notice_ok] = 'Post was successfully created.'
      redirect_to :action => 'menu', :controller => 'staff'
    else
      @user_list = get_user_list
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user_list = get_user_list
    @all_categories = get_all_categories
  end

  def update
    post_params =params[:post]
    @all_categories = get_all_categories
    checked_categories = get_categories_from(params[:categories])
    removed_categories = @all_categories - checked_categories
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      checked_categories.each {|cat| @post.categories << cat if !@post.categories.include?(cat) }
      removed_categories.each {|cat| @post.categories.delete(cat) if @post.categories.include?(cat) }
      flash[:notice_ok] = 'Post was successfully updated.'
      redirect_to :action => 'menu', :controller => 'staff'
    else
      @user_list =get_user_list
      render :action => 'edit'
    end
  end
  
  def destroy
   @post= Post.find(params[:id])
   if @post.destroy
    redirect_to :controller =>'staff',:action =>'menu'
    flash[:notice_ok] = 'Successfully deleted a post.'
   else 
    redirect_to '../staff/menu', :notice_nok => "Failed to delete a post."
   end
  end

  def get_user_list
    return User.find(:all, :order => 'last_name ASC').collect {|user| [user.full_name, user.id]}
  end

  def get_all_categories
    return Category.find(:all, :order => 'name ASC')
  end
  
  def get_categories_from(cat_list)
    cat_list = [] if cat_list.blank?
    return cat_list.collect {|cid| Category.find_by_id(cid.to_i)}.compact
  end
end
