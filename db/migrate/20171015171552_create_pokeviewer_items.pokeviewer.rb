# This migration comes from pokeviewer (originally 20170930185514)
class CreatePokeviewerItems < ActiveRecord::Migration[5.1]
  def change
    create_table :pokeviewer_items do |t|
      t.string :name, null: false
      t.boolean :tm, null: false, default: false
      t.references :move, null: true
      t.string :rs_description
      t.string :frlg_description
      t.string :emerald_description

      t.timestamps
    end

    add_foreign_key :pokeviewer_items, :pokeviewer_moves, column: :move_id
  end
end
