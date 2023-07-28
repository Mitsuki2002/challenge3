class Book < ApplicationRecord
  has_one_attached :profile_image

  belongs_to :user
  
  validates :title,presence:true
  # 最大２百字まで（length:(maximum:200)）
  	validates :body,presence:true,length:{maximum:200}
   
end
