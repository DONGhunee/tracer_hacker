class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  def is_like?(post) 
    Like.find_by(user_id: self.id, post_id: post.id).present?
  end
              
         
         
  has_many :post
  has_many :likes
  has_many :comments
end
