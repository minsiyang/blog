class ArticlesController < ApplicationController
    def index
      @articles = Article.all
    end
# show only the article it finds with the associate id
    def show
      @article = Article.find(params[:id])
    end

    def new
      @article = Article.new
    end
    # get request to render edit form
    def edit
      @article = Article.find(params[:id])
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
# Post route, follow by Edit action
    def update
      @article = Article.find(params[:id])
# if statement to validate whether the update is able to enter database     
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end

  private
#   avoid wrongful mass assignment, only require and allow the one that we need
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
