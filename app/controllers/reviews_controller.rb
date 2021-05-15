class ReviewsController < ApplicationController
  before_action :find_review, :find_pokemon, only: [:new, :create, :destroy, :edit, :update]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    @review.pokemon = @pokemon
    if @review.save!
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  def edit; end

  def update
    @review.update!(review_params)
    redirect_to pokemon_path(@pokemon)
  end

private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:pokemon_id, :content)
  end

  def find_pokemon
     @pokemon = Pokemon.find(params[:pokemon_id])
  end


end
