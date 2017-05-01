class HomeController < ApplicationController
  
  def index
  end
  
  def newest_renter
    @newest_renter = Rental.newest_renter
  end
  
  
end
