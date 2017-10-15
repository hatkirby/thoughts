# This migration comes from pokeviewer (originally 20170925013807)
class CreatePokeviewerLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :pokeviewer_locations do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
