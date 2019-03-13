class AddStartAndEndDatesToGame < ActiveRecord::Migration[5.2]
  def change
    change_table :games do |c|
      c.date :started_on
      c.date :finished_on
    end
  end
end
