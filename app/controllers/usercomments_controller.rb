class UsercommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @usercomment = @article.usercomments.create(usercomment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @usercomment = @article.usercomments.find(params[:id])
    @usercomment.destroy
    redirect_to article_path(@article)
  end

  private
    def usercomment_params
      params.require(:usercomment).permit( :body, :status)
    end
end
