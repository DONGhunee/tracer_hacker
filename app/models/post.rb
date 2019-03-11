class Post < ActiveRecord::Base
    
    acts_as_commentable
    
    belongs_to :user
    has_many :likes
    has_many :comments
    
    mount_uploader :image1, ImageUploader
    mount_uploader :image2, ImageUploader
    


end
