class User < ActiveRecord::Base
    has_many :games
    has_many :characters, through: :games
    has_many :items, through: :games
end