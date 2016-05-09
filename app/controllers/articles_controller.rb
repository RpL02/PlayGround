class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article , except: [:index, :new, :create]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new article_params
    if @article.save
      redirect_to @article
    else
      render :action => 'new'
    end
  end

  def show
    @commentable = @article
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :cover)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
