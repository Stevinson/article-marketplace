class PagesController < ApplicationController
  def home
  end

  # Action required to access the static page which gives information about Unpolarise
  def about
  end

  def dashboard
    @user = current_user
  end
end
