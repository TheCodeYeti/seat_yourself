class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :time
      t.date :reservation_date
      t.integer :party_size
      t.integer :user_id
      t.integer :restaurant_id
      t.text :note

      t.timestamps null: false
    end
  end
end
