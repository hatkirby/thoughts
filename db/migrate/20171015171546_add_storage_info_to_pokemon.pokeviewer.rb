# This migration comes from pokeviewer (originally 20170924160524)
class AddStorageInfoToPokemon < ActiveRecord::Migration[5.1]
  def change
    add_column :pokeviewer_pokemon, :box, :integer, null: true
    add_column :pokeviewer_pokemon, :slot, :integer, null: true
  end
end
