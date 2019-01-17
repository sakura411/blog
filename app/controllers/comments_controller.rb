class CommentsController < ApplicationController

  # Basic Authentication
  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  # Create action
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    if @comment.save
      redirect_to article_path(@article) # goes to show.html.erb
    else
      @errorcomment = "Name must be more than 2 characters."
      render 'articles/show'
    end
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
