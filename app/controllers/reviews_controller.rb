class ReviewsController < ApplicationController
  before_action :set_article

  def create
    @review = Review.new(review_params)
    @review.article = @article
    @review.user = current_user
    if @review.save # Valid inputs
      respond_to do |format| # Get input from html or js
        format.html { redirect_to article_path(@article) }
        format.js
      end
    else # Invalid inputs
      respond_to do |format| # Get input from html or js
        format.html { render "articles/show" }
        format.js
      end
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
