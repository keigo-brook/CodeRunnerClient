class Result < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :game_api
  belongs_to :parameter
end

