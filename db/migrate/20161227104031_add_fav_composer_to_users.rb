class AddFavComposerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fav_cmp1, :string
    add_column :users, :fav_cmp2, :string
    add_column :users, :fav_cmp3, :string
  end
end
