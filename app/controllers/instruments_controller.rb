class InstrumentsController < ApplicationController

  def index
  	if params[:rental_id]
  		@rental = Rental.find_by(id: params[:rental_id])
  		@instruments = @rental.instruments
  	else
  	    @instruments = Instrument.all
    end
  end
  
def new
	if params[:rental_id]
		@rental = Rental.find_by(id: params[:rental_id])
	else
		redirect_to new_rental_path
	end
	@instrument = Instrument.new
end

def create
  @rental = Rental.find_by(id: params[:rental_id])
  @instrument = Instrument.create(instrument_params)
  @rental.instruments << @instrument
  @rental.monthly_price += 40
  @rental.save
  redirect_to rentals_path
end

private

  def instrument_params
  	params.require(:instrument).permit(:instrument_type, :instrument_model)
  end

end
