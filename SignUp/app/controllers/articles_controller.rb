class ArticlesController < ApplicationController
	
	def new
  @article = Article.new
<<<<<<< HEAD
=======
  @category = Category.new
>>>>>>> 5eb42be2eea0344bb1dd7c13e0387ade6e81709c
end

def edit
  @article = Article.find(params[:id])
end

def create
<<<<<<< HEAD
   @article = Article.new(article_params)
   @article.user_id = current_user.id
=======
   category = Category.find_by_category(params[:article][:category][:category])
  hash = article_params
  hash[:user_id] = current_user.id
  @article = Article.new(hash) 
>>>>>>> 5eb42be2eea0344bb1dd7c13e0387ade6e81709c
    if @article.save
      if params[:photos].present?
    params[:photos]['image'].each do |a|
    @photo = @article.photos.create!(:image => a, :article_id => @article.id)
      end
    end
<<<<<<< HEAD
=======
    if category == nil
      category = Category.create(:category => params[:article][:category][:category]) if not params[:article][:category][:category].blank?
    end
    ArticleCategory.create(:article_id => @article.id, :category_id => category.id) if not params[:article][:category][:category].blank?
>>>>>>> 5eb42be2eea0344bb1dd7c13e0387ade6e81709c
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
<<<<<<< HEAD
	@articles = Article.paginate(:page => params[:page], :per_page => 3)
end
=======
	if params[:category] != nil
    @article = Category.find_by_id(params[:category][:category]).articles
  else
  @articles = Article.paginate(:page => params[:page], :per_page => 3)
end
end

>>>>>>> 5eb42be2eea0344bb1dd7c13e0387ade6e81709c
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

<<<<<<< HEAD
=======
def bycategory
  end

  def addcategory
  end

  def addcategory2
    category = Category.find_by_category(params[:category][:category])
    if category == nil
      category = Category.create(:category => params[:category][:category])
    end
    ac = ArticleCategory.find_by(:article_id => params[:article_id], :category_id => category.id)
    ArticleCategory.create(:article_id => params[:article_id], :category_id => category.id) if not ac
    redirect_to article_path(params[:article_id])
  end

>>>>>>> 5eb42be2eea0344bb1dd7c13e0387ade6e81709c
private
  def article_params
    params.require(:article).permit(:title, :text, :image)
  end

end