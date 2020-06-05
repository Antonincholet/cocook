class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :address, :date_time, :user_id, :offer_id, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
