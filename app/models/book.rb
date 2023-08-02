class Book < ApplicationRecord
  # has_one_attached :profile_image
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  
  validates :title,presence:true
  # 最大２百字まで（length:(maximum:200)）
  	validates :body,presence:true,length:{maximum:200}
  	
  	
  	
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
   
end
