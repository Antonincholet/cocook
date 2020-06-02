class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :address, :date_time, :user_id, :offer_id, presence: true
end
