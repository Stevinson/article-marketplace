class Article < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :title, presence: true, length: { in: 3..150 }
  validates :summary, presence: true, length: { in: 50..400 }
  validates :url, presence: true, allow_blank: false, url: true
  validates :price, presence: true, numericality: { only_integer: true }
end
