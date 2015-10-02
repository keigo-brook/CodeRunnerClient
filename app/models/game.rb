class Game < ActiveRecord::Base
  has_many :game_apis
  has_many :results
end
