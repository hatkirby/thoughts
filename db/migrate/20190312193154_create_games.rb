class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :status
      t.text :progress
      t.text :description
      t.integer :score

      t.timestamps
    end
  end
end
