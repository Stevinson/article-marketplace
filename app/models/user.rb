# A class which holds all the login for each user that uses the website
class User < ApplicationRecord
  has_many :articles, dependent: :destroy # A user can posess many articles
  has_many :bookings, dependent: :destroy # A user can create many bookings
  has_many :booked_articles, through: :bookings, source: :article # These are the articles that a user buys
  has_many :reviews, dependent: :destroy # A user can write many reviews

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # today_booked_articles are all the articles that a user has current access to (i.e. has bought)
  def today_booked_articles
    booked_articles.where("bookings.start_date <= :date AND bookings.end_date >= :date", date: Date.today)
  end

  # Method that receives hash from Facebook and checks if a user exists in our database
  # with the same credentials. If not it creates a new user with their details
  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
end
