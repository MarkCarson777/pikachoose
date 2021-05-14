class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def new
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @pokemon = Pokemon.find(params[:pokemon_id])
    # @booking.pokemon = @pokemon
    # @booking.user = current_user

    @booking = Booking.new(user: current_user, pokemon: @pokemon )
    if @booking.save!
    redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @booking.destroy
    redirect_to pokemon_path(@booking.pokemon)
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end
  
  def booking_params
    params.require(:booking).permit(:user_id, :pokemon_id)
  end
  
end
