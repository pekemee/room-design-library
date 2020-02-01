class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id, foreign_key: true
      t.integer :micropost_id, foreign_key: true

      t.timestamps

      t.index [:user_id,:created_at]
      t.index [:micropost_id,:created_at]
    end
      add_foreign_key :comments, :users
      add_foreign_key :comments, :microposts
  end
end
