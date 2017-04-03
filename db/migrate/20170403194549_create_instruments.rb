class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.integer :rental_id
      t.string :instrument_type
      t.boolean :accessories
      t.string :instrument_model

      t.timestamps null: false
    end
  end
end
