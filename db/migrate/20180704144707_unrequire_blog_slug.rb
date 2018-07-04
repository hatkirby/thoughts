class UnrequireBlogSlug < ActiveRecord::Migration[5.1]
  def change
    change_column_null :blogs, :slug, true
  end
end
