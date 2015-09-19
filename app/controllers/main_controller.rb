class MainController < ApplicationController

before_filter :set_all_categories, :set_archive_list,:set_latest_posts
layout 'public'

  def index
    @page_title = "index" 
    list
    render(:action => 'list')
  end

  def list
    @page_title = "list_post" 
    @posts = Post.find(:all, 
      :conditions => "status = 'published'",
      :order => 'posts.created_at DESC')
  end

  def category
    @page_title = "category" 
    @posts = Post.find(:all, 
      :include => [:author, :categories],
      :conditions => ["status = 'published' AND categories.id = ?", params[:id]], 
      :order => "posts.created_at DESC")
    

    render(:action => 'list')
  end

  def archive
    @page_title = "archive" 
    start_time = Time.mktime( params[:year] || 2015, 
                              params[:month] || 1, 
                              params[:day] || 1)
    end_time = start_time.next_month
    @posts = Post.find(:all, 
      :include => [:author, :categories],
      :conditions => ["status = 'published' AND posts.created_at BETWEEN ? AND ?", start_time, end_time], 
      :order => "posts.created_at DESC")
    render(:action => 'list')
  end

  def view_post
    @page_title ="view_post" 
    @post = Post.find(params[:id], :include=> [:author, :categories])
    render(:template => 'shared/view_post')
  end


  def latest_posts 
    @posts = Post.find(:all, 
      :conditions => "status = 'published'",
      :order => 'posts.created_at DESC',
      :conditions => "status = 'published'")
     render(:action => 'list')
    
  end

  private #-------
  
  def set_all_categories
    @all_categories = Category.find(:all, :order => 'name ASC')
  end
  def set_archive_list
    posts = Post.find(:all, :conditions => ["status = 'published'"], :order => "created_at DESC")
    @archive_list = posts.collect do |p|
      [p.created_at.strftime("%b %Y"), p.created_at.year, p.created_at.month]
    end
    @archive_list.uniq!
  end
  def set_latest_posts
    @posts = Post.find(:all,
      :conditions => "status = 'published'",
      :order => 'posts.created_at DESC',
      :conditions => "status = 'published'")
  end
end
