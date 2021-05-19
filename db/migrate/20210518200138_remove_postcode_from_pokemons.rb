class RemovePostcodeFromPokemons < ActiveRecord::Migration[6.0]
  def change
    remove_column :pokemons, :postcode, :string
  end
end
