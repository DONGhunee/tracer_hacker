class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title1
      t.string :title2
      
      
      
      t.string :content
      t.string :user_id
      t.integer :picked1
      t.integer :picked2
      t.timestamps null: false
    end
  end
end
