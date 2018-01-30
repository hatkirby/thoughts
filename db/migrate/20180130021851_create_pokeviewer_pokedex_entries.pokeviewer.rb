# This migration comes from pokeviewer (originally 20180129213822)
class CreatePokeviewerPokedexEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :pokeviewer_pokedex_entries do |t|
      t.references :trainer, null: true
      t.references :species, null: true
      t.boolean :caught, null: true, default: false

      t.timestamps
    end

    add_foreign_key :pokeviewer_pokedex_entries, :pokeviewer_trainers,
      column: :trainer_id

    add_foreign_key :pokeviewer_pokedex_entries, :pokeviewer_species,
      column: :species_id

    add_index :pokeviewer_pokedex_entries, [:trainer_id, :species_id],
      unique: true
  end
end
