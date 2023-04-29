class Monster < ApplicationRecord
    belongs_to :game
    has_and_belongs_to_many :effects
    validates_presence_of :name
end
