class UserMailer < ApplicationMailer

  # Welcome email for when users sign up to the site
  def welcome(user)
    # Instance varaiable for use in view
    @user = user
    # Render a view in `app/views/user_mailer`!
    mail(to: @user.email, subject: 'Welcome to Unpolarise!')
  end
end
