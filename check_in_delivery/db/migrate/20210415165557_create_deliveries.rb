class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :location
      t.integer :qty_lamps
      t.integer :qty_housings
      t.integer :qty_trims
      t.integer :qty_fixtures
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
