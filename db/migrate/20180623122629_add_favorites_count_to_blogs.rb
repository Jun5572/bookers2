class AddFavoritesCountToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :favorites_count, :integer
  end
end
