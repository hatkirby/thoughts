# This migration comes from pokeviewer (originally 20180114170238)
class CacheCurrentPokemonRevision < ActiveRecord::Migration[5.1]
  def up
    change_table :pokeviewer_pokemon do |t|
      t.references :current, null: true
    end

    add_foreign_key :pokeviewer_pokemon, :pokeviewer_revisions,
      column: :current_id

    Pokeviewer::Pokemon.all.each do |p|
      p.current_id = p.revisions.last.id
      p.save!
    end
  end

  def down
    remove_column :pokeviewer_pokemon, :current_id
  end
end
