# This migration comes from pokeviewer (originally 20171011015325)
class CreatePokeviewerAbilities < ActiveRecord::Migration[5.1]
  def change
    create_table :pokeviewer_abilities do |t|
      t.string :name, null: false, limit: 191
      t.string :description, null: false

      t.timestamps
    end

    add_index :pokeviewer_abilities, :name, unique: true
  end
end
