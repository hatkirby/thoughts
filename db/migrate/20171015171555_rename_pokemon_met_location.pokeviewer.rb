# This migration comes from pokeviewer (originally 20171003154157)
class RenamePokemonMetLocation < ActiveRecord::Migration[5.1]
  def up
    change_table :pokeviewer_pokemon do |t|
      t.references :location, null: true
    end

    add_foreign_key :pokeviewer_pokemon, :pokeviewer_locations,
      column: :location_id

    Pokeviewer::Pokemon.all.each do |p|
      unless p.met_location.nil?
        p.location_id = p.met_location.to_i
        p.save!
      end
    end

    remove_column :pokeviewer_pokemon, :met_location
  end

  def down
    add_column :pokeviewer_pokemon, :met_location, :string

    Pokeviewer::Pokemon.all.each do |p|
      unless p.location_id.nil?
        p.met_location = p.location_id.to_s
        p.save!
      end
    end

    remove_column :pokeviewer_pokemon, :location_id
  end
end
