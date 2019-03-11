class MainController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
     @post = Post.find(params[:id])
  end
  
 
  
  def like_toggle
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    #좋아요가 눌렸는지 체크
    if like.nil?
      Like.create(user_id: current_user.id, post_id: params[:post_id], pick: params[:pick])
    else
      like.destroy
    end
    redirect_to :back
  end
  
  
  def suffle
     
     @post = Post.offset(rand(Post.count)).first
     redirect_to :action => "index", :id => @post.id
  end
end
