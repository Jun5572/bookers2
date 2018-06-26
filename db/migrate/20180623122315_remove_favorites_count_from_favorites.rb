class RemoveFavoritesCountFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :favorites_count, :integer
  end
end
