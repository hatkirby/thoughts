# This migration comes from pokeviewer (originally 20170916234251)
class CreatePokeviewerPokemon < ActiveRecord::Migration[5.1]
  def change
    create_table :pokeviewer_pokemon do |t|
      t.string :uuid, null: false, limit: 191
      t.references :species, null: false
      t.references :trainer, null: true
      t.string :key, null: true, limit: 191
      t.string :ot_name, null: false
      t.integer :ot_number, null: false
      t.string :met_type, null: false
      t.string :met_location, null: true
      t.integer :met_level, null: false
      t.boolean :shiny, null: false, default: false
      t.string :nature, null: false
      t.string :gender, null: false
      t.boolean :second_ability, null: false
      t.string :unown_letter, null: true, limit: 1

      t.timestamps
    end

    add_index :pokeviewer_pokemon, :uuid, unique: true
    add_index :pokeviewer_pokemon, :key, unique: true

    add_foreign_key :pokeviewer_pokemon, :pokeviewer_species,
      column: :species_id

    add_foreign_key :pokeviewer_pokemon, :pokeviewer_trainers,
      column: :trainer_id
  end
end
