class CreateCommUsers < ActiveRecord::Migration
  def change
    create_table :comm_users do |t|
      t.references :comm, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
