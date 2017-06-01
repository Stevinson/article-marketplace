# This class overrides the devise controller to also allow other params - namely first name and last name
class RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:update]

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
    @user = User.update(user_params)
    redirect_to user_path(@user)
  end

  def top_readers
    # Returns top 3 readers based on bookings made on own articles
    readers_with_duplicates = []
    self.articles.each { |article| readers_with_duplicates << article.readers }
    readers = readers_with_duplicates.uniq
    frequency = Hash.new(0)
    readers.each { |reader| hash[reader] +=1 }
    hash.sort_by { |key, value| value }
    if readers.length > 1
      top_one = hash.keys.last
    elsif readers.length > 2
      hash.delete(top_one)
      top_two = hash.keys.last
    else
      hash.delete(top_two)
      top_three = hash.keys.last
    end
    return [top_one, top_two, top_three]
 end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Whitelist and return a hash of the params required
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
