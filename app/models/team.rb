class Team < ApplicationRecord
  has_many :bet
  has_many :game
end
