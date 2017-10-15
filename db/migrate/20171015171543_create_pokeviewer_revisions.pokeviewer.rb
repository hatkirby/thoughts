# This migration comes from pokeviewer (originally 20170917011258)
class CreatePokeviewerRevisions < ActiveRecord::Migration[5.1]
  def change
    create_table :pokeviewer_revisions do |t|
      t.references :pokemon, null: false
      t.integer :sequential_id, null: false
      t.string :nickname, null: false
      t.integer :experience, null: false
      t.integer :level, null: false
      t.integer :hp, null: false
      t.integer :attack, null: false
      t.integer :defense, null: false
      t.integer :special_attack, null: false
      t.integer :special_defense, null: false
      t.integer :speed, null: false
      t.integer :coolness, null: false
      t.integer :beauty, null: false
      t.integer :cuteness, null: false
      t.integer :smartness, null: false
      t.integer :toughness, null: false
      t.integer :sheen, null: false
      t.integer :hold_item, null: true
      t.references :move_1, null: false
      t.references :move_2, null: true
      t.references :move_3, null: true
      t.references :move_4, null: true
      t.integer :move_1_pp_bonuses, null: false, default: 0
      t.integer :move_2_pp_bonuses, null: false, default: 0
      t.integer :move_3_pp_bonuses, null: false, default: 0
      t.integer :move_4_pp_bonuses, null: false, default: 0

      t.timestamps
    end

    add_index :pokeviewer_revisions, [:pokemon_id, :sequential_id], unique: true

    add_foreign_key :pokeviewer_revisions, :pokewalker_pokemon,
      column: :pokemon_id

    add_foreign_key :pokeviewer_revisions, :pokewalker_moves,
      column: :move_1_id

    add_foreign_key :pokeviewer_revisions, :pokewalker_moves,
      column: :move_2_id

    add_foreign_key :pokeviewer_revisions, :pokewalker_moves,
      column: :move_3_id

    add_foreign_key :pokeviewer_revisions, :pokewalker_moves,
      column: :move_4_id
  end
end
