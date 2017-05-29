# Controller for the articles that a user has created themselves
class Admin::ArticlesController < ApplicationController
  # Get access to the articles that both belong to the current user
  def index
    @articles = current_user.articles
  end
end
