class Offer < ApplicationRecord
  belongs_to :user
  CUISINES = ['french', 'asian', 'japanese', 'italian', 'oriental', 'greek', 'spanish', 'swedish', 'fast food', 'argentine', 'brazilian', 'street food']
  KMS = %w(5 10 15 20 25 30 50 70 100 150)
  validates :cuisine, inclusion: { in: CUISINES }
  validates :label, :address, :km_perimeter, :cuisine, :rate_per_guest, presence: true
  has_many :reservations, dependent: :destroy
end
