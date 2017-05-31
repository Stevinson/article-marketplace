class PagesController < ApplicationController
  def home
    # So that our home page knows what @articles is to be able to render the index template
    @articles = Article.all
  end

  # Action required to access the static page which gives information about Unpolarise
  def about
  end

  def dashboard
    @user = current_user
  end
end
