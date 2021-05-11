class PokemonsController < ApplicationController
   before_action :find_pokemon, only: [:show, :destroy]
   
  def index
    @pokemons = Pokemon.all
  end

  def show; end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
