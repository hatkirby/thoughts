# This migration comes from pokeviewer (originally 20170930213633)
class RenameRevisionHoldItem < ActiveRecord::Migration[5.1]
  def change
    change_table :pokeviewer_revisions do |t|
      t.rename :hold_item, :item_id
    end

    add_foreign_key :pokeviewer_revisions, :pokeviewer_items, column: :item_id
  end
end
