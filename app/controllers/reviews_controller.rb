class ReviewsController < ApplicationController
  before_action :set_article
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.article = @article
    @review.user = current_user
    if @review.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
