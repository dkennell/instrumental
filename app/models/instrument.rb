class Instrument < ActiveRecord::Base
  belongs_to :rental
  
  validates :instrument_type, presence: true
  validates :instrument_model, presence: true

  def self.available
    where("rental_id = NULL")
  end
  
end
