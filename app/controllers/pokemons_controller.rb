class PokemonsController < ApplicationController
   before_action :find_pokemon, only: [:show, :destroy, :edit, :update]
   
  def index
    @pokemons = Pokemon.all
  end

  def show
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.user = current_user
    @pokemon.save!
    redirect_to pokemon_path(@pokemon)
  end

  def edit
  end

  def update
    @pokemon.update!(pokemon_params)
    redirect_to pokemon_path(@pokemon)
  end

  def destroy
    @pokemon.destroy
    redirect_to pokemons_path
  end

  private

  def find_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :category, :price)
  end
end
