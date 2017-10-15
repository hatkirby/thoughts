# This migration comes from pokeviewer (originally 20170930021856)
class AddGiftRibbonsToTrainer < ActiveRecord::Migration[5.1]
  def change
    change_table :pokeviewer_trainers do |t|
      t.references :marine_ribbon, null: true
      t.references :land_ribbon, null: true
      t.references :sky_ribbon, null: true
      t.references :country_ribbon, null: true
      t.references :national_ribbon, null: true
      t.references :earth_ribbon, null: true
      t.references :world_ribbon, null: true
    end

    add_foreign_key :pokeviewer_trainers, :pokeviewer_gift_ribbons,
      column: :marine_ribbon_id

    add_foreign_key :pokeviewer_trainers, :pokeviewer_gift_ribbons,
      column: :land_ribbon_id

    add_foreign_key :pokeviewer_trainers, :pokeviewer_gift_ribbons,
      column: :sky_ribbon_id

    add_foreign_key :pokeviewer_trainers, :pokeviewer_gift_ribbons,
      column: :country_ribbon_id

    add_foreign_key :pokeviewer_trainers, :pokeviewer_gift_ribbons,
      column: :national_ribbon_id

    add_foreign_key :pokeviewer_trainers, :pokeviewer_gift_ribbons,
      column: :earth_ribbon_id

    add_foreign_key :pokeviewer_trainers, :pokeviewer_gift_ribbons,
      column: :world_ribbon_id
  end
end
