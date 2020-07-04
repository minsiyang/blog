class CommentsController < ApplicationController
#   only authenticated users can delete comments
  http_basic_authenticate_with name: "dhh", password: "secret", 
  only: :destroy
  
  def create
    # find the aritcle id from comment db
    @article = Article.find(params[:article_id])
    # create an comment for that article and insert in comment db
    @comment = @article.comments.create(comment_params)
    # redirect back to current article path for show action for the article
    redirect_to article_path(@article)
  end

  def destroy
    # find the aritcle from id from comment db
    @article = Article.find(params[:article_id])
    # locate the comment within the @article.comments array.
    @comment = @article.comments.find(params[:id])
    # delete that comment
    @comment.destroy
    # redirect back to current article path in the show action for the article
    redirect_to article_path(@article)
  end

        
  private
    def comment_params
    params.require(:comment).permit(:commenter, :body)
    end
end
