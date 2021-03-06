# Controller to process the logic necessary on the articles that users post and buy.
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to dashboard_path
  end

  private

  # Whitelist and return a hash of the params required
  def article_params
    params.require(:article).permit(:title, :summary, :url, :price, :photo)
  end

  # Find the article by its ID
  def set_article
    @article = Article.find(params[:id])
  end
end
