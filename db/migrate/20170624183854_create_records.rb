class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.text :description
      t.references :recordable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
