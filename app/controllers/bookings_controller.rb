class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.find(params[:pokemon_id])
  end

  def show
    
    @pokemon = @booking.pokemon
  end

  def new
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking.user = current_user
    # @booking = Booking.new(user: current_user, pokemon: @pokemon)

    @booking.pokemon = @pokemon
    if @booking.save!
    redirect_to booking_path(@booking)
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
    params.require(:booking).permit(:user_id, :pokemon_id, :start_date, :end_date)
  end

end
