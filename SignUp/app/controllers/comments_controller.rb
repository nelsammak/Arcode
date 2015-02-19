class CommentsController < ApplicationController
  before_action :redirect_user
	def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(:body => params[:comment][:body], :user_id => @current_user.id)
    redirect_to article_path(@article)
  end
 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
