# This migration comes from pokeviewer (originally 20171003191205)
class RemoveBoxes < ActiveRecord::Migration[5.1]
  def up
    change_table :pokeviewer_trainers do |t|
      t.string :box_1_name, null: false, default: ""
      t.string :box_2_name, null: false, default: ""
      t.string :box_3_name, null: false, default: ""
      t.string :box_4_name, null: false, default: ""
      t.string :box_5_name, null: false, default: ""
      t.string :box_6_name, null: false, default: ""
      t.string :box_7_name, null: false, default: ""
      t.string :box_8_name, null: false, default: ""
      t.string :box_9_name, null: false, default: ""
      t.string :box_10_name, null: false, default: ""
      t.string :box_11_name, null: false, default: ""
      t.string :box_12_name, null: false, default: ""
      t.string :box_13_name, null: false, default: ""
      t.string :box_14_name, null: false, default: ""
    end

    change_column_default :pokeviewer_trainers, :box_1_name, nil
    change_column_default :pokeviewer_trainers, :box_2_name, nil
    change_column_default :pokeviewer_trainers, :box_3_name, nil
    change_column_default :pokeviewer_trainers, :box_4_name, nil
    change_column_default :pokeviewer_trainers, :box_5_name, nil
    change_column_default :pokeviewer_trainers, :box_6_name, nil
    change_column_default :pokeviewer_trainers, :box_7_name, nil
    change_column_default :pokeviewer_trainers, :box_8_name, nil
    change_column_default :pokeviewer_trainers, :box_9_name, nil
    change_column_default :pokeviewer_trainers, :box_10_name, nil
    change_column_default :pokeviewer_trainers, :box_11_name, nil
    change_column_default :pokeviewer_trainers, :box_12_name, nil
    change_column_default :pokeviewer_trainers, :box_13_name, nil
    change_column_default :pokeviewer_trainers, :box_14_name, nil

    Pokeviewer::Trainer.all.each do |t|
      boxes = ActiveRecord::Base.connection.select_all(
        "SELECT * FROM pokeviewer_boxes WHERE trainer_id = ? ORDER BY number ASC",
        t.trainer_id).map { |b| b["name"] }

      t.box_1_name = boxes.shift
      t.box_2_name = boxes.shift
      t.box_3_name = boxes.shift
      t.box_4_name = boxes.shift
      t.box_5_name = boxes.shift
      t.box_6_name = boxes.shift
      t.box_7_name = boxes.shift
      t.box_8_name = boxes.shift
      t.box_9_name = boxes.shift
      t.box_10_name = boxes.shift
      t.box_11_name = boxes.shift
      t.box_12_name = boxes.shift
      t.box_13_name = boxes.shift
      t.box_14_name = boxes.shift

      t.save
    end

    drop_table :pokeviewer_boxes
  end

  def down
    create_table :pokeviewer_boxes do |t|
      t.integer "trainer_id", null: false
      t.integer "number", null: false
      t.string "name", null: false

      t.timestamps
    end

    add_index :pokeviewer_boxes, [:trainer_id, :number], unique: true

    add_foreign_key :pokeviewer_boxes, :pokeviewer_trainers, column: :trainer_id

    Pokeviewer::Trainer.all.each do |t|
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 1, name: t.box_1_name)
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 2, name: t.box_2_name)
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 3, name: t.box_3_name)
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 4, name: t.box_4_name)
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 5, name: t.box_5_name)
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 6, name: t.box_6_name)
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 7, name: t.box_7_name)
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 8, name: t.box_8_name)
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 9, name: t.box_9_name)
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 10, name: t.box_10_name)
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 11, name: t.box_11_name)
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 12, name: t.box_12_name)
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 13, name: t.box_13_name)
      Pokeviewer::Box.create(trainer_id: t.trainer_id, number: 14, name: t.box_14_name)
    end

    remove_column :pokeviewer_trainers, :box_1_name
    remove_column :pokeviewer_trainers, :box_2_name
    remove_column :pokeviewer_trainers, :box_3_name
    remove_column :pokeviewer_trainers, :box_4_name
    remove_column :pokeviewer_trainers, :box_5_name
    remove_column :pokeviewer_trainers, :box_6_name
    remove_column :pokeviewer_trainers, :box_7_name
    remove_column :pokeviewer_trainers, :box_8_name
    remove_column :pokeviewer_trainers, :box_9_name
    remove_column :pokeviewer_trainers, :box_10_name
    remove_column :pokeviewer_trainers, :box_11_name
    remove_column :pokeviewer_trainers, :box_12_name
    remove_column :pokeviewer_trainers, :box_13_name
    remove_column :pokeviewer_trainers, :box_14_name
  end
end
