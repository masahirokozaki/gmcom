class CreateComms < ActiveRecord::Migration
  def change
    create_table :comms do |t|
      t.string :name
      t.string :image
      t.text :content

      t.timestamps null: false
    end
  end
end
