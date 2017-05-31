class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_one :review
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_must_be_before_end_date

  private

  def start_must_be_before_end_date
    errors.add(:start_date, "must be before end time") unless start_date < end_date
  end
end
