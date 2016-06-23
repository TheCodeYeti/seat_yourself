class Restaurant < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :reservations
  has_many :users, through: :reservations


  TIMES = { 1 => "1:00AM", 2 => "2:00AM", 3 => "3:00AM", 4 => "4:00AM", 5 => "5:00AM", 6 => "6:00AM", 7 => "7:00AM", 8 => "8:00AM", 9 => "9:00AM", 10 => "10:00AM", 11 => "11:00AM", 12 => "12:00PM" , 13 => "1:00PM", 14 => "2:00PM", 15 => "3:00PM", 16 => "4:00PM", 17 => "5:00PM", 18 => "6:00PM", 19 => "7:00PM", 20 => "8:00PM", 21 => "9:00PM", 22 => "10:00PM", 23 => "11:00PM",24 => "12:00AM"}

  def self.times

    return TIMES

  end


end
