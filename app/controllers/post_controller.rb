class PostController < ApplicationController
  def create
    @post = Post.new
    @post.title1 = params[:title1]
    @post.title2 = params[:title2]
    @post.image1 = params[:image1]
    @post.image2 = params[:image2]
    @post.content = params[:content]
    
    if user_signed_in?
      @post.user_id = current_user.id
    else 
      @post.user_id = "no"
    end
    
    @post.save
    
  end
  
  def upload
  end
  
  
end
