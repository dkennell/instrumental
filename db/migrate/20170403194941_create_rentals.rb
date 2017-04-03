class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :user_id
      t.integer :monthly_price
      t.boolean :insurance
      t.boolean :rent_to_own

      t.timestamps null: false
    end
  end
end
