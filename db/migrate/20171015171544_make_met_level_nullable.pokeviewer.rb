# This migration comes from pokeviewer (originally 20170924035127)
class MakeMetLevelNullable < ActiveRecord::Migration[5.1]
  def change
    change_column :pokeviewer_pokemon, :met_level, :integer, null: true
  end
end
