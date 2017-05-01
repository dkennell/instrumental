class Rental < ActiveRecord::Base
	has_many :instruments
	belongs_to :user
	validates :instruments, presence: true

  def instrument_attributes=(instrument_attributes)
      self.instruments.build(instrument_attributes)
  end
  
  def self.newest_renter
      Rental.last.user
  end

end
