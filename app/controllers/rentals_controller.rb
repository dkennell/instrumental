class RentalsController < ApplicationController

  def index
  	@rentals = current_user.rentals
  end

  def new
  	@rental = Rental.new
  	@instrument = Instrument.new
  end

  def create
        binding.pry

    @rental = Rental.create(rental_params)
    if params[:rental][:instruments_attributes][:instrument_type].empty? || params[:rental][:instruments_attributes][:instrument_model].empty?
      @instrument = Instrument.find_by(id: params[:rental][:instrument][:instrument_id])
      @rental.instruments << @instrument
    else
      @rental.instrument_attributes=(params[:rental][:instruments_attributes])
    end
    current_user.rentals << @rental
    redirect_to rentals_path
  end


private

  def rental_params
  	params.require(:rental).permit(:instrument_id :insurance, :rent_to_own, :monthly_price, :instruments_attributes => [:instrument_type, :instrument_model])
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