class ArticlesController < ApplicationController
    def index
      @articles = Article.all
    end

    def show
      @article = Article.find(params[:id])
    end

  
    def new
      @article = Article.new
    end
    
    def create
      # saving the params hash from the form input into article model as an instance
      @article = Article.new(article_params)
      #  saving the model in the database
      if @article.save
        redirect_to @article
      else
        render 'new'
      end
    end

  
  
  private
#   avoid wrongful mass assignment, only require and allow the one that we need
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
