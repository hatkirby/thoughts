# This migration comes from pokeviewer (originally 20171004203404)
class AddPokeballToPokemon < ActiveRecord::Migration[5.1]
  def change
    change_table :pokeviewer_pokemon do |t|
      t.string :pokeball, null: false, default: :poke
    end

    change_column_default :pokeviewer_pokemon, :pokeball, nil
  end
end
