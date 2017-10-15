# This migration comes from pokeviewer (originally 20170930213633)
class RenameRevisionHoldItem < ActiveRecord::Migration[5.1]
  def change
    remove_column :pokeviewer_revisions, :hold_item, :integer

    change_table :pokeviewer_revisions do |t|
      t.integer :item_id
    end

    add_foreign_key :pokeviewer_revisions, :pokeviewer_items, column: :item_id
  end
end
