class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :label
      t.text :description
      t.string :cuisine
      t.string :address
      t.integer :km_perimeter
      t.integer :rate_per_guest
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
