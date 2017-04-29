class Instrument < ActiveRecord::Base
  belongs_to :rental
  
  validates :instrument_type, presence: true
  validates :instrument_model, presence: true
end
