class Character < ActiveRecord::Base
    has_many :games
    has_many :users, through: :games
    has_many :items, through: :games
end