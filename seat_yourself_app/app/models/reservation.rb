class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :reservation_date, :reservation_time, presence: true
end
