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
    # byebug
    # render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      # render plain: @article.inspect
      flash[:notice] = 'Article was created successfully'
      # redirect_to article_path(@article)
      redirect_to @article # has the same effect as above
    else
      render 'new'
    end

  end

end