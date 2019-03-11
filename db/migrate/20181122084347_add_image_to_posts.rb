class AddImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image1, :string
    add_column :posts, :image2, :string
  end
end
