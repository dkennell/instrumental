class InstrumentsController < ApplicationController

  def index
  	if params[:rental_id]
  		@rental = Rental.find_by(id: params[:rental_id])
  		@instruments = Instrument.available
  	else
 	    @instruments = Instrument.available
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
  @instrument = Instrument.create(instrument_params)

  if @instrument.invalid?
    redirect_to :back, :flash => {:error => @instrument.errors.full_messages}
  else

  @rental = Rental.find_by(id: params[:rental_id])
  @rental.instruments << @instrument
  @rental.monthly_price += 40
  @rental.save
  redirect_to rentals_path
  end
end

private

  def instrument_params
  	params.require(:instrument).permit(:instrument_type, :instrument_model)
  end

end
