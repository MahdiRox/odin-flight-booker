class AddBookingIdToPassenger < ActiveRecord::Migration[7.1]
  def change
    add_reference :passengers, :booking, foreign_key: true, null: false
  end
end
