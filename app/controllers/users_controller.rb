# This class overrides the devise controller to also allow other params - namely first name and last name
class RegistrationsController < Devise::RegistrationsController
  before_action set_user, only: [:update]

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

  private

  # Whitelist and return a hash of the params required
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
