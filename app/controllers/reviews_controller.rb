class ReviewsController < ApplicationController
  before_action :find_review, only: [:destroy, :edit, :update]
  def index
    @reviews = Review.where(user: current_user)
  end
  
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save!
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @review.update!(review_params)
    redirect_to bookings_path
  end

private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:booking_id, :content)
  end
end
