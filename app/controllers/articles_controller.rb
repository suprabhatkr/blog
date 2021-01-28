class ArticlesController < ApplicationController
  #before_action :authorize,except: [:index,:show]
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :correct_user, only: [:edit,:update,:destroy]
  def index
  	@articles = Article.all 
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @user = current_user
    @article = @user.articles.new
  end

  def create
    @user = current_user
    @article = @user.articles.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to article_path, notice: "you are not authorized" if @article.nil?
  end
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end
    private
    def article_params
      params.require(:article).permit(:title, :body,:status)
    end

end
