class CommentController < ApplicationController
    
     #TODO: user authentication

    def index
        redirect_to root_path
    end
  
    def new
        @item = Item.find_by(id: params[:item_id])
        @comment = Comment.build_from(@item, current_user.id, "")
    end

    def show
        @comment = Comment.find_by(id: params[:id])
        @item = Item.find_by(id: @comment.commentable_id)
        if current_user
            @new_comment    = Comment.build_from(@item, current_user.id, "")  
        end
    end
    

    def create
        commentable = commentable_type.constantize.find(commentable_id)
        @comment = Comment.build_from(commentable, current_user.id, body)

        respond_to do |format|
          if @comment.save
            make_child_comment
            format.html  {
              if root_comment_id
                redirect_to comment_path(root_comment_id)
              else
                redirect_to item_path(commentable_id) 
              end
            }
            format.js
          else
            format.html  { render :action => "new" }
            format.js
          end
        end
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
        @comment.destroy
        respond_to do |format|
          format.html { redirect_to(:back)}
          format.js
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id, :root_comment_id)
    end

    def root_comment_id
        comment_params[:root_comment_id]
    end

    def commentable_type
        comment_params[:commentable_type]
    end

    def commentable_id
        comment_params[:commentable_id]
    end

    def comment_id
        comment_params[:comment_id]
    end

    def body
        comment_params[:body]
    end

    def make_child_comment
        return "" if comment_id.blank?
        
        parent_comment = Comment.find comment_id
        @comment.move_to_child_of(parent_comment)
    end
    
end
