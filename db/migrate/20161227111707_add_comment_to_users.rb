class AddCommentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cmt, :text
  end
end
