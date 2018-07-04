class AddBlogDrafts < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :published, :boolean, null: false, default: false
    add_column :blogs, :published_at, :datetime, null: true

    reversible do |dir|
      dir.up do
        Blog.all.each do |blog|
          blog.published = true
          blog.published_at = blog.created_at

          blog.save!
        end
      end
    end
  end
end
