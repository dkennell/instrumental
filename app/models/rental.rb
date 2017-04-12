class Rental < ActiveRecord::Base
	has_many :instruments
	accepts_nested_attributes_for :instruments



end
