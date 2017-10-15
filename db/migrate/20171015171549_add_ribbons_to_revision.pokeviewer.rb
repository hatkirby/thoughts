# This migration comes from pokeviewer (originally 20170929211529)
class AddRibbonsToRevision < ActiveRecord::Migration[5.1]
  def change
    change_table :pokeviewer_revisions do |t|
      t.integer :cool_ribbons, null: false, default: 0
      t.integer :beauty_ribbons, null: false, default: 0
      t.integer :cute_ribbons, null: false, default: 0
      t.integer :smart_ribbons, null: false, default: 0
      t.integer :tough_ribbons, null: false, default: 0
      
      t.boolean :champion_ribbon, default: false
      t.boolean :winning_ribbon, default: false
      t.boolean :victory_ribbon, default: false
      t.boolean :artist_ribbon, default: false
      t.boolean :effort_ribbon, default: false
      t.boolean :marine_ribbon, default: false
      t.boolean :land_ribbon, default: false
      t.boolean :sky_ribbon, default: false
      t.boolean :country_ribbon, default: false
      t.boolean :national_ribbon, default: false
      t.boolean :earth_ribbon, default: false
      t.boolean :world_ribbon, default: false
    end
  end
end
