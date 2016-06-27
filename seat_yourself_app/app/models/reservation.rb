class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  # validates :reservation_date, :reservation_time, presence: true
  validate :can_reserve?

  def can_reserve?
    (self.party_size > 0) && (self.restaurant.remaining_capacity(self.reservation_date, self.reservation_time) > self.party_size)
      # errors.add(:capacity, "Not enough room for your party at #{self.reservation_time} on #{self.reservation_date}")
    # end
  end
end
