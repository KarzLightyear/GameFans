class Genre < ApplicationRecord
  has_many :games
  
  attachment :profile_image, destroy: false
end
