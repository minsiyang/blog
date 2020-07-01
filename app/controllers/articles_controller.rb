class ArticlesController < ApplicationController
  def new
  end

  def create
    # saving the params hash from the form input into article model as an instance
    @article = Article.new(article_params)
    #  saving the model in the database
    @article.save
    redirect_to @article
  end
  
  private
#   avoid wrongful mass assignment, only require and allow the one that we need
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
