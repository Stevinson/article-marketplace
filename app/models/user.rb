class User < ApplicationRecord
  has_many :articles
  has_many :bookings
  has_many :booked_articles, through: :bookings, source: :article
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def today_booked_articles
    booked_articles.where("bookings.start_date <= :date AND bookings.end_date >= :date", date: Date.today)
  end
end
