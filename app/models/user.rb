class User < ApplicationRecord
  has_many :articles
  has_many :bookings
  has_many :booked_articles, through: :bookings, source: :article
  has_many :reviews

  validates :username, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # today_booked_articles are all the articles that a user has current access to
  def today_booked_articles
    booked_articles.where("bookings.start_date <= :date AND bookings.end_date >= :date", date: Date.today)
  end
end
