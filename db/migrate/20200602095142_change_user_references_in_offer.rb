class ChangeUserReferencesInOffer < ActiveRecord::Migration[6.0]
  def change
     remove_reference :offers, :users, null: false, foreign_key: true
  end
end
