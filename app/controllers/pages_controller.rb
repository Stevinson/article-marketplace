class PagesController < ApplicationController
  def home
    # if there's a search happening, @articles is just the articles that correspond to the search, if not @articles is all the articles within the index
    if params[:search]
      @articles = Article.where('title iLIKE ?', "%#{params[:search]}%")
      # if there's no articles that correspond to the search query, then @articles is all the articles of the index
      if !@articles.any?
        @articles = Article.all # So that our home page knows what @articles is - to be able to render the index template
      end
    else
      @articles = Article.all
    end
  end

  # Action required to access the static page which gives information about Unpolarise
  def about
  end

  def dashboard
    @user = current_user
  end
end

