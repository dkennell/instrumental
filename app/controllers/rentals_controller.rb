class RentalsController < ApplicationController

  def index
  	@rentals = current_user.rentals
  end

  def new
  	@rental = Rental.new
  	@instrument = Instrument.new
  end

  def create
    @rental = Rental.new(rental_params)
    
      if @rental.instruments.first.invalid?
          redirect_to new_rental_path, :flash => {:error => @rental.instruments.first.errors.full_messages}
      else

    
        @rental.save
          @rental.monthly_price = rental_price
          current_user.rentals << @rental
        redirect_to rentals_path
      end
  end


private

  def rental_params
    params.require(:rental).permit(:insurance, :rent_to_own, :monthly_price, :instrument_attributes => [:instrument_type, :instrument_model])
  end

  def rental_price
  	total = 40
    if params[:rental][:insurance] == "1"
    	total += 10
    end
    if params[:rental][:rent_to_own] == "1"
    	total += 10
    end
    return total
  end

end