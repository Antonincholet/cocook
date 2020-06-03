class Offer < ApplicationRecord
  belongs_to :user
  CUISINES = ['french', 'asian', 'japanese', 'italian', 'oriental', 'greek', 'spanish', 'swedish', 'fast food', 'argentine', 'brazilian', 'street food']
  validates :cuisine, inclusion: { in: CUISINES }
  validates :label, :address, :km_perimeter, :cuisine, :rate_per_guest, presence: true
  has_many :reservations, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
