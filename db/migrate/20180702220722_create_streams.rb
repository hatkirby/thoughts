class CreateStreams < ActiveRecord::Migration[5.1]
  def change
    create_table :streams do |t|
      t.string :title
      t.text :body
      t.string :slug

      t.timestamps
    end
  end
end
