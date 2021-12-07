class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :full_name
      t.string :email
      t.string :room
      t.datetime :date

      t.timestamps
    end
  end
end
