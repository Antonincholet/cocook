class Offer < ApplicationRecord
  belongs_to :user
  CUISINES = ['french', 'asian', 'japanese', 'italian', 'oriental', 'greek', 'spanish', 'swedish', 'fast food', 'argentine', 'brazilian', 'street food']
  validates :cuisine, inclusion: { in: CUISINES }
  validates :label, :address, :km_perimeter, :cuisine, :rate_per_guest, presence: true
end
