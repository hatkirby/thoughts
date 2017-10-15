# This migration comes from pokeviewer (originally 20171011015648)
class AddTypeAndAbilityToSpecies < ActiveRecord::Migration[5.1]
  def change
    change_table :pokeviewer_species do |t|
      t.string :type_1, null: false, default: ""
      t.string :type_2
      t.integer :ability_1_id, null: false, default: 0
      t.integer :ability_2_id
    end

    change_column_default :pokeviewer_species, :type_1, nil
    change_column_default :pokeviewer_species, :ability_1_id, nil

    add_foreign_key :pokeviewer_species, :pokeviewer_abilities,
      column: :ability_1_id

    add_foreign_key :pokeviewer_species, :pokeviewer_abilities,
      column: :ability_2_id
  end
end
