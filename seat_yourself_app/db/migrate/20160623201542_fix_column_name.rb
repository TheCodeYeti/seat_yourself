class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :reservations, :time, :reservation_time
    rename_column :reservations, :note, :notes
  end
end
