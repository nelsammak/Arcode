class ArticlesController < ApplicationController
	
	def new
  @article = Article.new
end

def edit
  @article = Article.find(params[:id])
end

def create
   @article = Article.new(article_params)
   @article.user_id = current_user.id
    if @article.save
      if params[:photos].present?
    params[:photos]['image'].each do |a|
    @photo = @article.photos.create!(:image => a, :article_id => @article.id)
      end
    end
    redirect_to @article
  else
    render 'new'
  end
end



def update
  @article = Article.find(params[:id])
  
  if @article.update(article_params)
     if params[:photos].present?
    params[:photos]['image'].each do |a|
    @photo = @article.photos.create!(:image => a, :article_id => @article.id)
    end
  end
    redirect_to @article
  else
    render 'edit'
  end
end

def index
	@article = Article.all
end
def show
    @article = Article.find(params[:id])
    @photos = @article.photos.all
    @post_by = User.find_by(id: @article.user_id)
    @comments = @article.comments
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end

private
  def article_params
    params.require(:article).permit(:title, :text, :image)
  end

end