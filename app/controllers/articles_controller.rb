class ArticlesController < ApplicationController
  # user to be autehnticated on every action except index and show
  http_basic_authenticate_with name: "dhh", password: "secret", 
  except: [:index, :show]
  # display all articles
    def index
      @articles = Article.all
    end
# show only the article it finds with the associate id
    def show
      @article = Article.find(params[:id])
    end
# Get route to show the form
    def new
      @article = Article.new
    end
    # get route to render edit_article path
    def edit
      @article = Article.find(params[:id])
    end
#  post route to post saved database and redirect to show route   
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
# delete route, with destroy method to delete selected article from database
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
     
      redirect_to articles_path
    end

  private
#   avoid wrongful mass assignment, only require and allow the one that we need
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
