class CreateUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :updates do |t|
      t.references :stream, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
