class RentalsController < ApplicationController

  def index
  	@rentals = current_user.rentals
  end

  def new
  	@rental = Rental.new
  	@instrument = Instrument.new
  end

  def create
    if params[:rental][:instrument][:instrument_id].empty?
    	@instrument = Instrument.create(instrument_type: params[:rental][:instrument][:new_instrument_type], instrument_model: params[:rental][:instrument][:new_instrument_model])
    else
    	@instrument = Instrument.find_by(id: params[:rental][:instrument][:instrument_id])
    end
    @rental = Rental.create(insurance: params[:rental][:insurance], rent_to_own: params[:rental][:rent_to_own], monthly_price: rental_price)
    @rental.instruments << @instrument
    current_user.rentals << @rental
    redirect_to rentals_path
  end


private

  def rental_params
  	params.require(:rental).permit
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