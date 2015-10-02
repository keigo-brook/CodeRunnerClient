class GameApi < ActiveRecord::Base
  has_many :parameters
  has_many :results
  belongs_to :game

  accepts_nested_attributes_for :parameters
end
