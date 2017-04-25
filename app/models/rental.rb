class Rental < ActiveRecord::Base
	has_many :instruments
	validates :instruments, presence: true

  def instrument_attributes=(instrument_attributes)
      self.instruments.build(instrument_attributes)
  end

end
