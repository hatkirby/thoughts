# This migration comes from pokeviewer (originally 20170930190647)
class AddDescriptionAndTypeToMoves < ActiveRecord::Migration[5.1]
  def change
    change_table :pokeviewer_moves do |t|
      t.string :move_type, null: false, default: ""
      t.string :rs_description, null: false, default: ""
      t.string :frlg_description, null: false, default: ""
      t.string :emerald_description
    end

    change_column_default :pokeviewer_moves, :move_type, nil
    change_column_default :pokeviewer_moves, :rs_description, nil
    change_column_default :pokeviewer_moves, :frlg_description, nil
  end
end
