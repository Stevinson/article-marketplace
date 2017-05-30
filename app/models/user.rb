# A class which holds all the login for each user that uses the website
class User < ApplicationRecord
  has_many :articles # A user can posess many articles
  has_many :bookings # A user can create many bookings
  has_many :booked_articles, through: :bookings, source: :article # These are the articles that a user buys
  has_many :reviews # A user can write many reviews

  # Ensure that a user has a unique username
  validates :username, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # today_booked_articles are all the articles that a user has current access to (i.e. has bought)
  def today_booked_articles
    booked_articles.where("bookings.start_date <= :date AND bookings.end_date >= :date", date: Date.today)
  end
end
