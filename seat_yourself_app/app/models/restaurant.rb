class Restaurant < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :reservations
  has_many :users, through: :reservations


  validates :description,  :name, :address,  presence: true
  validates :capacity, :numericality => { :only_integer => true, :greater_than => 0}

  validates :close_time, :numericality => { :only_integer => true, :greater_than_or_equal_to => :open_time, :message => " must be greater than open time!"  }
# validates :close_time, greater_than: :open_time { only_integer: true }

  TIMES = { 1 => "1:00AM", 2 => "2:00AM", 3 => "3:00AM", 4 => "4:00AM", 5 => "5:00AM", 6 => "6:00AM", 7 => "7:00AM", 8 => "8:00AM", 9 => "9:00AM", 10 => "10:00AM", 11 => "11:00AM", 12 => "12:00PM" , 13 => "1:00PM", 14 => "2:00PM", 15 => "3:00PM", 16 => "4:00PM", 17 => "5:00PM", 18 => "6:00PM", 19 => "7:00PM", 20 => "8:00PM", 21 => "9:00PM", 22 => "10:00PM", 23 => "11:00PM",24 => "12:00AM"}

  def self.times

    return TIMES

  end
# validates :stock_qty, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }


  # t.string   "name"
  # t.integer  "capacity"
  # t.string   "address"
  # t.text     "description"
  # t.integer  "open_time"
  # t.integer  "close_time"
  # t.integer  "user_id"


end
