class CreateComments < ActiveRecord::Migration
  def change
    create_table :comment2s do |t|
      
      t.integer :user_id
      t.integer :post_id
      t.text :content
      t.string :category
      
      t.timestamps null: false
    end
  end
end
