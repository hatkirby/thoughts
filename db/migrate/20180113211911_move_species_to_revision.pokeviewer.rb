# This migration comes from pokeviewer (originally 20180113200119)
class MoveSpeciesToRevision < ActiveRecord::Migration[5.1]
  def up
    change_table :pokeviewer_revisions do |t|
      t.references :species, null: true
    end

    Pokeviewer::Revision.all.each do |r|
      r.species_id = r.pokemon.species_id
      r.save!
    end

    remove_column :pokeviewer_pokemon, :species_id

    change_column_null :pokeviewer_revisions, :species_id, false

    add_foreign_key :pokeviewer_revisions, :pokeviewer_species,
      column: :species_id
  end

  def down
    def up
      change_table :pokeviewer_pokemon do |t|
        t.references :species, null: true
      end

      Pokeviewer::Pokemon.all.each do |p|
        p.species_id = p.revisions.first.species_id
        p.save!
      end

      remove_column :pokeviewer_revisions, :species_id

      change_column_null :pokeviewer_pokemon, :species_id, false

      add_foreign_key :pokeviewer_pokemon, :pokeviewer_species,
        column: :species_id
    end
  end
end
