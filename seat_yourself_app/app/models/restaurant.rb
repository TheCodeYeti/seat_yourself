class Restaurant < ActiveRecord::Base

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  has_many :reservations
  has_many :users, through: :reservations

  validates :description,  :name, :address,  presence: true
  validates :capacity, :numericality => { :only_integer => true, :greater_than => 0}

  validates :close_time, :numericality => { :only_integer => true, :greater_than_or_equal_to => :open_time, :message => " must be greater than open time!"  }

  TIMES = { 1 => "1:00AM", 2 => "2:00AM", 3 => "3:00AM", 4 => "4:00AM", 5 => "5:00AM", 6 => "6:00AM", 7 => "7:00AM", 8 => "8:00AM", 9 => "9:00AM", 10 => "10:00AM", 11 => "11:00AM", 12 => "12:00PM" , 13 => "1:00PM", 14 => "2:00PM", 15 => "3:00PM", 16 => "4:00PM", 17 => "5:00PM", 18 => "6:00PM", 19 => "7:00PM", 20 => "8:00PM", 21 => "9:00PM", 22 => "10:00PM", 23 => "11:00PM",24 => "12:00AM"}

  def self.times

    return TIMES

  end

  def available_times
    available_times = (open_time...close_time).map do |time_unit|
      time_unit
    end

  end

  def can_reserve?(party_size, reservation_date, reservation_time)
    (party_size > 0) && (remaining_capacity(reservation_date, reservation_time) > party_size)
  end

  def remaining_capacity(day, time_slot)
    self.capacity - self.reservations.where(reservation_time = time_slot).sum(:party_size)
  end
end
