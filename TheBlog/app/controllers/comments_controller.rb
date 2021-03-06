class CommentsController < ApplicationController

	  def create
    @article = Article.find(params[:article_id])
    @user = current_user
    @comment = @article.comments.new(comment_params)
    @comment.user_id= current_user.id
    @comment.save
    redirect_to article_path(@article)
  end
 
 def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

def index
   
end

private 

def comment_params
  params.require(:comment).permit(:body, :article_id)
end


end
