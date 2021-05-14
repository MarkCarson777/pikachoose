class ReviewsController < ApplicationController
  
  def new
    @pokemon = Pokemon.find(params[:pokemon_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @pokemon = Pokemon.find(params[:pokemon_id])

    @review.pokemon = @pokemon
    if @review.save!
      redirect_to pokemons_path
    else
      render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:pokemon_id, :content)
  end
end
