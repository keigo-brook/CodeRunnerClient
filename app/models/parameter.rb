class Parameter < ActiveRecord::Base
  has_many :results
  belongs_to :game_api
end
