class Game < ApplicationRecord
    validates_uniqueness_of :id
    has_many :players, dependent: :destroy
    has_many :monsters, dependent: :destroy
    belongs_to :user

    after_update do
        puts "After update hook triggered"
        if saved_change_to_fight?
          puts "The 'fight' attribute is being changed"
          if !fight
            players.each do |player|
              player.update(initiative: 0, active: false)
            end
            puts "Initiatives of players have been reset to 0"
                  
            monsters.each do |monster|
              monster.destroy
            end
            puts "Monsters have been destroyed"
            
            update(turn: 0)
            puts "The 'turn' attribute has been set to 0"
          end
        else
          puts "The 'fight' attribute is not being changed"
        end
    end
      
    def to_param
        code.parameterize
    end

    def self.find_by_param(code)
        find_by_code(code)
    end

    private

    def reset_initiatives
      if !fight
        players.update_all(initiative: 0)
      end
    end
end
