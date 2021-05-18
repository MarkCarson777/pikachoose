class AddStreetAddressToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :street_address, :string
  end
end
