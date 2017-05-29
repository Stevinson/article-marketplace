class Article < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :title, presence: true, length: { in: 3..150 }
  validates :summary, presence: true, length: { in: 50..400 }
  validates :url, presence: true, format: { with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix }
end
