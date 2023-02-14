class Game < ApplicationRecord
    validates_uniqueness_of :id
    has_many :players
    has_many :monsters
    belongs_to :user
end
