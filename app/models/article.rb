class Article < ApplicationRecord
  # Define relations with other models
  belongs_to :user
  has_many :bookings
  has_many :reviews
  # Each article is to have one image
  has_attachment :photo
  # Validations on an article's attributes
  validates :title, presence: true, length: { in: 3..150 }
  validates :summary, presence: true, length: { in: 50..400 }
  validates :url, presence: true, allow_blank: false, url: true
  validates :price, presence: true, numericality: { only_integer: true }
end
