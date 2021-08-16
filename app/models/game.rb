class Game < ApplicationRecord
  belongs_to :genre, optional: true
end
