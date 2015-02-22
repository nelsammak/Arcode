class CommentOnCommentController < ApplicationController
	 def create
    @comment = Comment.find(params[:comment_id])
    @user = current_user
    @comment_on_comment = @comment.comment_on_comments.new(comment_on_comment_params)
    @comment_on_comment.user_id= current_user.id
    @comment_on_comment.save
    redirect_to article_path(@article)
  end
 
 def destroy
    @comment = Comment.find(params[:comment_id])
    @comment_on_comment = @comment.comment_on_comments.find(params[:id])
    @comment_on_comment.destroy
    redirect_to article_path(@article)
  end

def index
   
end

private 

def comment_params
  params.require(:comment_on_comment).permit(:field, :comment_id)
end
end
