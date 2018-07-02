class RenameEntriesToBlogs < ActiveRecord::Migration[5.1]
  def up
    rename_table :entries, :blogs
    
    remove_column :blogs, :type
    
    Record.where(recordable_type: "Entry").each do |r|
      r.recordable_type = "Blog"
      r.save!
    end
  end
  
  def down
    rename_table :blogs, :entries
    
    add_column :entries, :type, :string, null: false, default: "Blog"
    change_column_default :entries, :type, nil
    
    Record.where(recordable_type: "Blog").each do |r|
      r.recordable_type = "Entry"
      r.save!
    end
  end
end
