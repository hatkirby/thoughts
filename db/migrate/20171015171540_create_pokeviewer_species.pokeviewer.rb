# This migration comes from pokeviewer (originally 20170916232015)
class CreatePokeviewerSpecies < ActiveRecord::Migration[5.1]
  def change
    create_table :pokeviewer_species do |t|
      t.string :name, null: false, limit: 191

      t.timestamps
    end

    add_index :pokeviewer_species, :name, unique: true
  end
end
