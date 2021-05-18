class AddPostcodeToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :postcode, :string
  end
end
