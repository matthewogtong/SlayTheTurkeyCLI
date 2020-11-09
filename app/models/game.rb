class Game < ActiveRecord::Base
    belongs_to :user
    belongs_to :character
    has_many :items
end