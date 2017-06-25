class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :body
      t.string :slug, null: false
      t.string :type, null: false

      t.timestamps
    end
  end
end
