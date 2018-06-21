class RenamePostBlogIdToPostComments < ActiveRecord::Migration[5.2]
  def change
  	rename_column :post_comments, :post_blog_id, :blog_id
  end
end
