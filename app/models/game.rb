class Game < ApplicationRecord
  belongs_to :user
  belongs_to :genre, optional: true

  has_many :game_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
