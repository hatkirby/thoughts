# This migration comes from pokeviewer (originally 20170924224550)
class CreatePokeviewerBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :pokeviewer_boxes do |t|
      t.references :trainer, null: false
      t.integer :number, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_foreign_key :pokeviewer_boxes, :pokeviewer_trainers, column: :trainer_id

    add_index :pokeviewer_boxes, [:trainer_id, :number], unique: true
  end
end
